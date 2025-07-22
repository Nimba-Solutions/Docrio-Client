public class DocrioFieldSerializer {
    private static final String NAMESPACE = 'litify_docs';
    
    // Map of Apex-friendly names to their corresponding API names
    private static Map<String, String> nameMapping = new Map<String, String>{
        'relatedTo' => 'litify_docs__Related_To__c',
        'folderPath' => 'litify_docs__Folder_Path__c',
        'fileType' => 'litify_docs__File_Type__c',
        'customField' => 'Custom_Field__c'
        // Add more mappings as needed
    };
    
    // Serialize a DocrioField to JSON
    public static Object serialize(DocrioField field) {
        return field.getValue();
    }
    
    // Deserialize JSON to DocrioField
    public static DocrioField deserialize(Object jsonObj, String apexName) {
        String apiName = getApiName(apexName);
        return DocrioField.fromJson((String)jsonObj, apiName);
    }
    
    // Get API name from Apex-friendly name
    public static String getApiName(String apexName) {
        return nameMapping.containsKey(apexName) 
            ? nameMapping.get(apexName) 
            : DocrioField.apexNameToApiName(apexName, NAMESPACE);
    }
    
    // Get Apex-friendly name from API name
    public static String getApexName(String apiName) {
        for(String apexName : nameMapping.keySet()) {
            if(nameMapping.get(apexName) == apiName) {
                return apexName;
            }
        }
        return DocrioField.apiNameToApexName(apiName);
    }
} 