public class ExternalCredentialService {

    public static ConnectApi.ExternalCredential getExternalCredential(String developerName) {
        ConnectApi.ExternalCredential fetchedEC = ConnectApi.NamedCredentials.getExternalCredential(developerName);
        System.debug('External Credential fetched successfully');
        String jsonEC = JSON.serialize(fetchedEC);
        System.debug(jsonEC);
        return fetchedEC;
    }
    
    // The package ships with all the External Credentials it requires.
    // We need this to address some nuances of ConnectAPI Test Coverage
    public static ConnectApi.ExternalCredential createExternalCredential(String developerName, String masterLabel, String principalName) {
        ConnectApi.ExternalCredentialInput externalCredentialInput = new ConnectApi.ExternalCredentialInput();
        
        externalCredentialInput.developerName = developerName;
        externalCredentialInput.masterLabel = masterLabel;
        externalCredentialInput.authenticationProtocol = ConnectApi.CredentialAuthenticationProtocol.Custom;
        
        externalCredentialInput.principals = new List<ConnectApi.ExternalCredentialPrincipalInput>();
        
        // Populate principals to connect the external credential to permissions
        ConnectApi.ExternalCredentialPrincipalInput principalOne = new ConnectApi.ExternalCredentialPrincipalInput();
        principalOne.principalName = principalName;
        principalOne.principalType = ConnectApi.CredentialPrincipalType.NamedPrincipal;
        principalOne.sequenceNumber = 1;
        externalCredentialInput.principals.add(principalOne);
        ConnectApi.ExternalCredential externalCredential = ConnectApi.NamedCredentials.createExternalCredential(externalCredentialInput);
        return externalCredential;
    }
    
    public static void createCredentialValues(String externalCredentialName, String principalName, Map<String, String> credentialValues) {
        ConnectApi.CredentialInput credValues = buildCredentialInput(externalCredentialName, principalName, credentialValues);
        ConnectApi.Credential credential = ConnectApi.NamedCredentials.createCredential(credValues);
        system.debug(JSON.serialize(credential));
    }
    
    public static void updateCredentialValues(String externalCredentialName, String principalName, Map<String, String> credentialValues) {
        ConnectApi.CredentialInput credValues = buildCredentialInput(externalCredentialName, principalName, credentialValues);
        ConnectApi.NamedCredentials.updateCredential(credValues);
    }
    
    /**
     * Attempts to update credential values, falls back to create if update fails
     * @param externalCredentialName The name of the external credential
     * @param principalName The principal name
     * @param credentialValues Map of credential values to upsert
     */
    public static void upsertCredentialValues(String externalCredentialName, String principalName, Map<String, String> credentialValues) {
        try {
            // Try to update first
            updateCredentialValues(externalCredentialName, principalName, credentialValues);
        } catch (ConnectApi.ConnectApiException e) {
            // If update fails for any reason, try to create
            createCredentialValues(externalCredentialName, principalName, credentialValues);
        }
    }
    
    private static ConnectApi.CredentialInput buildCredentialInput(String externalCredentialName, String principalName, Map<String, String> credentialValues) {
        ConnectApi.CredentialInput credValues = new ConnectApi.CredentialInput();
        credValues.authenticationProtocol = ConnectApi.CredentialAuthenticationProtocol.Custom;
        credValues.externalCredential = externalCredentialName;
        credValues.principalName = principalName;
        credValues.principalType = ConnectApi.CredentialPrincipalType.NamedPrincipal;
        
        Map<String, ConnectApi.CredentialValueInput> credentials = new Map<String, ConnectApi.CredentialValueInput>();
        for(String key : credentialValues.keySet()) {
            credentials.put(key, buildCredentialValue(credentialValues.get(key), false));
        }
        credValues.credentials = credentials;
        return credValues;
    }

    private static ConnectApi.CredentialValueInput buildCredentialValue(String value, Boolean encrypted) {
        ConnectApi.CredentialValueInput credentialValue = new ConnectApi.CredentialValueInput();
        credentialValue.value = value;
        credentialValue.encrypted = false;
        return credentialValue;
    }
    
    /**
     * Updates the endpoint URL of a Named Credential if different from current
     * @param namedCredentialName The developer name of the Named Credential to update
     * @param newEndpointUrl The new endpoint URL to set
     */
    public static void updateNamedCredentialEndpoint(String namedCredentialName, String newEndpointUrl) {
        try {
            // Get the existing Named Credential
            ConnectApi.NamedCredential namedCred = ConnectApi.NamedCredentials.getNamedCredential(namedCredentialName);
            
            // Only update if the URL is different
            if (namedCred.calloutUrl != newEndpointUrl) {
                // Create input for update
                ConnectApi.NamedCredentialInput input = new ConnectApi.NamedCredentialInput();
                input.developerName = namedCred.developerName;
                input.masterLabel = namedCred.masterLabel;
                input.calloutUrl = newEndpointUrl;
                input.type = namedCred.type;
                
                // Update the Named Credential
                ConnectApi.NamedCredentials.createNamedCredential(input);
                System.debug('Named Credential endpoint updated to: ' + newEndpointUrl);
            } else {
                System.debug('Named Credential endpoint already set to: ' + newEndpointUrl);
            }
        } catch (Exception e) {
            System.debug(LoggingLevel.ERROR, 'Error updating Named Credential endpoint: ' + e.getMessage());
            throw new ExternalCredentialException('Failed to update Named Credential endpoint: ' + e.getMessage());
        }
    }
    
    public class ExternalCredentialException extends Exception {}
}