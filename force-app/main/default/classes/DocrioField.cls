public class DocrioField {
    private String value;
    private String apiName;
    
    public DocrioField(String apiName) {
        this.apiName = apiName;
    }
    
    public String getValue() {
        return value;
    }
    
    public void setValue(String value) {
        this.value = value;
    }
    
    public String getApiName() {
        return apiName;
    }
    
    // For JSON serialization
    public Object toJson() {
        return value;
    }
    
    // Static constructor for deserialization
    public static DocrioField fromJson(Object jsonValue, String apiName) {
        DocrioField field = new DocrioField(apiName);
        field.setValue((String)jsonValue);
        return field;
    }
} 