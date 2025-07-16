public with sharing class CredentialManagerController {
    
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