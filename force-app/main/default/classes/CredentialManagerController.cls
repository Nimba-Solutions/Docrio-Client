public with sharing class CredentialManagerController {
    
    @AuraEnabled
    public static void saveCredentialValues(String externalCredentialName, String principalName, Map<String, String> credentialValues) {
        try {
            ExternalCredentialService.createCredentialValues(externalCredentialName, principalName, credentialValues);
        } catch(Exception e) {
            throw new AuraHandledException('Failed to save credentials: ' + e.getMessage());
        }
    }

    @AuraEnabled
    public static void updateCredentialValues(String externalCredentialName, String principalName, Map<String, String> credentialValues) {
        try {
            ExternalCredentialService.updateCredentialValues(externalCredentialName, principalName, credentialValues);
        } catch(Exception e) {
            throw new AuraHandledException('Failed to update credentials: ' + e.getMessage());
        }
    }
} 