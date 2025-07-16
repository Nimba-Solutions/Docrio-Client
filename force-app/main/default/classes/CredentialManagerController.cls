public with sharing class CredentialManagerController {
    
    @AuraEnabled
    public static String getCurrentEndpoint(String namedCredentialName) {
        try {
            return ExternalCredentialService.getCurrentEndpoint(namedCredentialName);
        } catch(Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void updateNamedCredentialEndpoint(String namedCredentialName, String newEndpointUrl) {
        try {
            ExternalCredentialService.updateNamedCredentialEndpoint(namedCredentialName, newEndpointUrl);
        } catch(Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    @AuraEnabled
    public static void saveCredentialValues(String externalCredentialName, String principalName, Map<String, String> credentialValues) {
        try {
            // 1. Save/Update the credential values
            ExternalCredentialService.upsertCredentialValues(externalCredentialName, principalName, credentialValues);
          
            // obtaining the new URL from the org info should be done when the LWC is loaded
            // we should display the URL value in the LWC
        } catch(Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
} 