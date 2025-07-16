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
    
}