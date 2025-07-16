public with sharing class DocrioClient {
    
    // Default Named Credential for Docrio API
    private static final String DOCRIO_API_NAMED_CREDENTIAL = 'DocrioAPI';
    private static final String DOCRIO_CLIENT_NAMED_CREDENTIAL = 'DocrioClient';
    
    // Instance variable to store the named credential
    private String apiCredential;
    private String clientCredential;
    
    /**
     * Constructor - initializes the DocrioClient with default named credentials
     */
    public DocrioClient() {
        this.apiCredential = DOCRIO_API_NAMED_CREDENTIAL;
        this.clientCredential = DOCRIO_CLIENT_NAMED_CREDENTIAL;
    }
    
    /**
     * Constructor - initializes the DocrioClient with custom named credentials
     * @param apiCredential The name of the API named credential to use
     * @param clientCredential The name of the client named credential to use
     */
    public DocrioClient(String apiCredential, String clientCredential) {
        this.apiCredential = apiCredential;
        this.clientCredential = clientCredential;
    }
    
    /**
     * Universal callout method that handles all Docrio API requests
     * @param method HTTP method (GET, POST, PUT, DELETE)
     * @param endpoint API endpoint (e.g., '/v1/files')
     * @param body Request body (optional, for POST/PUT requests)
     * @param contentType Content-Type header (optional)
     * @return Map<String, Object> Parsed JSON response
     */
    private Map<String, Object> doCallout(String method, String endpoint, String body, String contentType) {
        try {
            // Get Salesforce access token
            String salesforceToken = this.getSalesforceToken();
            
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('callout:' + this.apiCredential + endpoint);
            request.setMethod(method);
            
            // Set required headers for all Docrio API calls
            request.setHeader('Authorization', 'Bearer ' + salesforceToken);
            request.setHeader('X-API-KEY', '{!$Credential.DocrioCredentials.api_key}');
            request.setHeader('Accept', '*/*');
            request.setHeader('Cache-Control', 'no-cache');
            
            // Set content type if provided
            if (String.isNotBlank(contentType)) {
                request.setHeader('Content-Type', contentType);
            }
            
            // Set body if provided
            if (String.isNotBlank(body)) {
                request.setBody(body);
            }
            
            // Debug the request
            System.debug('=== DOCRIO API REQUEST ===');
            System.debug('Method: ' + method);
            System.debug('Endpoint: ' + endpoint);
            System.debug('Full URL: ' + request.getEndpoint());
            System.debug('Headers: ' + request.getHeader('Authorization') + ', ' + request.getHeader('X-API-KEY'));
            System.debug('Body: ' + body);
            System.debug('=== END REQUEST ===');
            
            HttpResponse response = http.send(request);
            
            System.debug('=== DOCRIO API RESPONSE ===');
            System.debug('Status: ' + response.getStatusCode());
            System.debug('Body: ' + response.getBody());
            System.debug('=== END RESPONSE ===');
            
            if (response.getStatusCode() >= 200 && response.getStatusCode() < 300) {
                if (String.isNotBlank(response.getBody())) {
                    return (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                } else {
                    return new Map<String, Object>{'success' => true};
                }
            } else {
                throw new DocrioException('API call failed. Status: ' + response.getStatusCode() + ', Body: ' + response.getBody());
            }
        } catch (Exception e) {
            System.debug('DocrioClient.doCallout error: ' + e.getMessage());
            throw new DocrioException('Error in API call: ' + e.getMessage());
        }
    }
    
    /**
     * Gets the base URL for the named credential
     * @return String The base URL that matches the named credential configuration
     */
    public String getBaseUrl() {
        try {
            // Create a dummy request to extract the base URL from the named credential
            HttpRequest request = new HttpRequest();
            request.setEndpoint('callout:' + this.apiCredential);
            
            // Extract the base URL from the endpoint
            String fullEndpoint = request.getEndpoint();
            // Remove the 'callout:' prefix to get just the URL
            String baseUrl = fullEndpoint.substring('callout:'.length());
            
            return baseUrl;
        } catch (Exception e) {
            throw new DocrioException('Error getting base URL: ' + e.getMessage());
        }
    }
    
    /**
     * Gets a Salesforce access token
     * @return String The access token
     */
    public String getSalesforceToken() {
        try {                 
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('callout:' + this.clientCredential + '/services/oauth2/token');
            request.setMethod('POST');
            request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
            
            // Build the request body with OAuth parameters using the correct principal
            String body = 'grant_type=password' +
                         '&client_id={!$Credential.DocrioCredentials.client_id}' +
                         '&client_secret={!$Credential.DocrioCredentials.client_secret}' +
                         '&username={!$Credential.DocrioCredentials.username}' +
                         '&password={!$Credential.DocrioCredentials.password}';
            
            request.setBody(body);
            
            HttpResponse response = http.send(request);

            if (response.getStatusCode() == 200) {
                Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                String accessToken = (String) responseMap.get('access_token');
                System.debug('Extracted Access Token: ' + accessToken);
                System.debug('Access Token (Base64): ' + EncodingUtil.base64Encode(Blob.valueOf(accessToken)));
                return accessToken;
            } else {
                throw new DocrioException('Failed to obtain Salesforce access token. Status: ' + response.getStatusCode() + ', Body: ' + response.getBody());
            }
        } catch (Exception e) {
            throw new DocrioException('Error obtaining Salesforce access token: ' + e.getMessage());
        }
    }
    
    /**
     * Gets file(s) from Docrio API using Named Credential
     */
    public Map<String, Object> getFiles(List<String> fileIds) {
        String fileIdsParam = String.join(fileIds, ',');
        String endpoint = '/v1/files?Ids=' + fileIdsParam;
        return doCallout('GET', endpoint, null, null);
    }
    
    /**
     * Gets file(s) information from Docrio API using Named Credential
     */
    public Map<String, Object> getFileInfo(List<String> fileIds) {
        String fileIdsParam = String.join(fileIds, ',');
        String endpoint = '/v1/files/info?Ids=' + fileIdsParam;
        return doCallout('GET', endpoint, null, null);
    }
    
    /**
     * Deletes files via Docrio API using Named Credential
     */
    public Map<String, Object> deleteFiles(List<String> fileIds) {
        String fileIdsParam = String.join(fileIds, ',');
        String endpoint = '/v1/files?Ids=' + fileIdsParam;
        return doCallout('DELETE', endpoint, null, null);
    }
    
    /**
     * Uploads a file to Docrio (three-step process) using Named Credential
     */
    public Map<String, Object> uploadFile(String fileName, String fileContent, String recordId) {
        try {
            // Step 1: POST /files to get signed URL
            String step1Body = JSON.serialize(new Map<String, Object>{
                'fileName' => fileName,
                'recordId' => recordId
            });
            Map<String, Object> step1Result = doCallout('POST', '/files', step1Body, 'application/json');
            String signedUrl = (String) step1Result.get('signedUrl');
            String fileId = (String) step1Result.get('fileId');
            
            // Step 2: PUT to signed URL to upload file
            Http http = new Http();
            HttpRequest step2Request = new HttpRequest();
            step2Request.setEndpoint(signedUrl);
            step2Request.setMethod('PUT');
            step2Request.setHeader('Content-Type', 'application/octet-stream');
            step2Request.setBodyAsBlob(EncodingUtil.base64Decode(fileContent));
            HttpResponse step2Response = http.send(step2Request);
            if (step2Response.getStatusCode() != 200) {
                throw new DocrioException('Step 2 failed. Status: ' + step2Response.getStatusCode() + ', Body: ' + step2Response.getBody());
            }
            
            // Step 3: POST /files/complete to finalize
            String step3Body = JSON.serialize(new Map<String, Object>{
                'fileId' => fileId
            });
            return doCallout('POST', '/files/complete', step3Body, 'application/json');
        } catch (Exception e) {
            throw new DocrioException('Error uploading file: ' + e.getMessage());
        }
    }

    /**
     * Downloads file content directly from signed URL
     * @param url The signed URL to download from
     * @return Blob The file content as a blob
     */
    public Blob downloadFile(String url) {
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(url);
            request.setMethod('GET');
            request.setHeader('Accept', '*/*');
            request.setHeader('Cache-Control', 'no-cache');
            request.setHeader('Accept-Encoding', 'gzip, deflate, br');
            request.setHeader('Connection', 'keep-alive');
            
            HttpResponse response = http.send(request);
            
            if (response.getStatusCode() == 200) {
                return response.getBodyAsBlob();
            } else {
                throw new DocrioException('Failed to download file. Status: ' + response.getStatusCode());
            }
        } catch (Exception e) {
            throw new DocrioException('Error downloading file: ' + e.getMessage());
        }
    }
    
    /**
     * Gets organization information via direct API call
     * @return Map<String, Object> The organization information
     */
    public Map<String, Object> getOrgInfo() {
        try {
            String salesforceToken = this.getSalesforceToken();
            
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://2xm5rfl2q0.execute-api.us-east-2.amazonaws.com/v1/orginfo');
            request.setMethod('GET');
            request.setHeader('Authorization', 'Bearer ' + salesforceToken);
            
            HttpResponse response = http.send(request);
            
            if (response.getStatusCode() == 200) {
                return (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            } else {
                throw new DocrioException('Failed to get org info. Status: ' + response.getStatusCode() + ', Body: ' + response.getBody());
            }
        } catch (Exception e) {
            throw new DocrioException('Error getting org info: ' + e.getMessage());
        }
    }
    
    // Custom exception class
    public class DocrioException extends Exception {}
}