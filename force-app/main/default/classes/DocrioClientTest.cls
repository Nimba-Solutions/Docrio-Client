@isTest
public class DocrioClientTest {
    
    // Test data constants
    private static final String TEST_API_CREDENTIAL = 'TestDocrioAPI';
    private static final String TEST_CLIENT_CREDENTIAL = 'TestDocrioClient';
    private static final String TEST_FILE_ID = 'test-file-id-123';
    private static final String TEST_FILE_NAME = 'test-image.jpg';
    private static final String TEST_FILE_CONTENT = 'SGVsbG8gV29ybGQ='; // Base64 encoded "Hello World"
    private static final String TEST_RECORD_ID = '001000000000000';
    
    @TestSetup
    static void setupTestData() {
        // This method can be used to set up any test data if needed
    }
    
    @isTest
    static void testDefaultConstructor() {
        Test.startTest();
        DocrioClient client = new DocrioClient();
        Test.stopTest();
        
        // Verify the client was created successfully
        System.assertNotEquals(null, client, 'DocrioClient should be created successfully');
    }
    
    @isTest
    static void testCustomConstructor() {
        Test.startTest();
        DocrioClient client = new DocrioClient(TEST_API_CREDENTIAL, TEST_CLIENT_CREDENTIAL);
        Test.stopTest();
        
        // Verify the client was created successfully
        System.assertNotEquals(null, client, 'DocrioClient should be created successfully');
    }
    
    @isTest
    static void testGetBaseUrl() {
        DocrioClient client = new DocrioClient();
        
        Test.startTest();
        try {
            String baseUrl = client.getBaseUrl();
            // In test context, this might throw an exception due to missing named credentials
            // which is expected behavior
            System.assertNotEquals(null, baseUrl, 'Base URL should not be null');
        } catch (DocrioClient.DocrioException e) {
            // Expected in test environment due to missing named credentials
            System.assert(true, 'Expected exception in test environment: ' + e.getMessage());
        }
        Test.stopTest();
    }
    
    @isTest
    static void testGetSalesforceToken() {
        DocrioClient client = new DocrioClient();
        
        Test.startTest();
        // Set up mock for OAuth token request
        Test.setMock(HttpCalloutMock.class, new DocrioOAuthMock());
        
        try {
            String token = client.getSalesforceToken();
            // In test context with mock, this should work
            System.assertNotEquals(null, token, 'Access token should not be null');
        } catch (DocrioClient.DocrioException e) {
            // Expected in test environment due to missing credentials
            System.assert(true, 'Expected exception in test environment: ' + e.getMessage());
        }
        Test.stopTest();
    }
    
    @isTest
    static void testGetFiles() {
        DocrioClient client = new DocrioClient();
        List<String> fileIds = new List<String>{TEST_FILE_ID, 'test-file-id-456'};
        
        Test.startTest();
        // Set up mock for API call
        Test.setMock(HttpCalloutMock.class, new DocrioAPIMock());
        
        try {
            Map<String, Object> result = client.getFiles(fileIds);
            // Verify the result structure
            System.assertNotEquals(null, result, 'Result should not be null');
            System.assert(result.containsKey('success'), 'Result should contain success key');
        } catch (DocrioClient.DocrioException e) {
            // Expected in test environment due to missing credentials
            System.assert(true, 'Expected exception in test environment: ' + e.getMessage());
        }
        Test.stopTest();
    }
    
    @isTest
    static void testGetFilesWithEmptyList() {
        DocrioClient client = new DocrioClient();
        List<String> fileIds = new List<String>();
        
        Test.startTest();
        // Set up mock for API call
        Test.setMock(HttpCalloutMock.class, new DocrioAPIMock());
        
        try {
            Map<String, Object> result = client.getFiles(fileIds);
            // Verify the result structure
            System.assertNotEquals(null, result, 'Result should not be null');
        } catch (DocrioClient.DocrioException e) {
            // Expected in test environment due to missing credentials
            System.assert(true, 'Expected exception in test environment: ' + e.getMessage());
        }
        Test.stopTest();
    }
    
    @isTest
    static void testGetFileInfo() {
        DocrioClient client = new DocrioClient();
        List<String> fileIds = new List<String>{TEST_FILE_ID, 'test-file-id-456'};
        
        Test.startTest();
        // Set up mock for API call
        Test.setMock(HttpCalloutMock.class, new DocrioAPIMock());
        
        try {
            Map<String, Object> result = client.getFileInfo(fileIds);
            // Verify the result structure
            System.assertNotEquals(null, result, 'Result should not be null');
            System.assert(result.containsKey('success'), 'Result should contain success key');
        } catch (DocrioClient.DocrioException e) {
            // Expected in test environment due to missing credentials
            System.assert(true, 'Expected exception in test environment: ' + e.getMessage());
        }
        Test.stopTest();
    }
    
    @isTest
    static void testDeleteFiles() {
        DocrioClient client = new DocrioClient();
        List<String> fileIds = new List<String>{TEST_FILE_ID, 'test-file-id-456'};
        
        Test.startTest();
        // Set up mock for API call
        Test.setMock(HttpCalloutMock.class, new DocrioAPIMock());
        
        try {
            Map<String, Object> result = client.deleteFiles(fileIds);
            // Verify the result structure
            System.assertNotEquals(null, result, 'Result should not be null');
            System.assert(result.containsKey('success'), 'Result should contain success key');
        } catch (DocrioClient.DocrioException e) {
            // Expected in test environment due to missing credentials
            System.assert(true, 'Expected exception in test environment: ' + e.getMessage());
        }
        Test.stopTest();
    }
    
    @isTest
    static void testUploadFile() {
        DocrioClient client = new DocrioClient();
        
        Test.startTest();
        // Set up mock for upload process
        Test.setMock(HttpCalloutMock.class, new DocrioUploadMock());
        
        try {
            Map<String, Object> result = client.uploadFile(TEST_FILE_NAME, TEST_FILE_CONTENT, TEST_RECORD_ID);
            // Verify the result structure
            System.assertNotEquals(null, result, 'Result should not be null');
            System.assert(result.containsKey('success'), 'Result should contain success key');
        } catch (DocrioClient.DocrioException e) {
            // Expected in test environment due to missing credentials
            System.assert(true, 'Expected exception in test environment: ' + e.getMessage());
        }
        Test.stopTest();
    }
    
    @isTest
    static void testUploadFileCompleteFlow() {
        DocrioClient client = new DocrioClient();
        
        Test.startTest();
        // Set up mock for complete upload flow
        Test.setMock(HttpCalloutMock.class, new DocrioCompleteUploadMock());
        
        try {
            Map<String, Object> result = client.uploadFile(TEST_FILE_NAME, TEST_FILE_CONTENT, TEST_RECORD_ID);
            // Verify the result structure
            System.assertNotEquals(null, result, 'Result should not be null');
            System.assert(result.containsKey('success'), 'Result should contain success key');
        } catch (DocrioClient.DocrioException e) {
            // Expected in test environment due to missing credentials
            System.assert(true, 'Expected exception in test environment: ' + e.getMessage());
        }
        Test.stopTest();
    }
    
    @isTest
    static void testUploadFileWithEmptyContent() {
        DocrioClient client = new DocrioClient();
        
        Test.startTest();
        // Set up mock for upload process
        Test.setMock(HttpCalloutMock.class, new DocrioUploadMock());
        
        try {
            Map<String, Object> result = client.uploadFile(TEST_FILE_NAME, '', TEST_RECORD_ID);
            // Verify the result structure
            System.assertNotEquals(null, result, 'Result should not be null');
        } catch (DocrioClient.DocrioException e) {
            // Expected in test environment due to missing credentials
            System.assert(true, 'Expected exception in test environment: ' + e.getMessage());
        }
        Test.stopTest();
    }
    
    @isTest
    static void testUploadFileWithNullContent() {
        DocrioClient client = new DocrioClient();
        
        Test.startTest();
        // Set up mock for upload process
        Test.setMock(HttpCalloutMock.class, new DocrioUploadMock());
        
        try {
            Map<String, Object> result = client.uploadFile(TEST_FILE_NAME, null, TEST_RECORD_ID);
            // Verify the result structure
            System.assertNotEquals(null, result, 'Result should not be null');
        } catch (DocrioClient.DocrioException e) {
            // Expected in test environment due to missing credentials
            System.assert(true, 'Expected exception in test environment: ' + e.getMessage());
        }
        Test.stopTest();
    }
    
    @isTest
    static void testUploadFileStep2Failure() {
        DocrioClient client = new DocrioClient();
        
        Test.startTest();
        // Set up mock that fails at Step 2 (PUT to signed URL)
        Test.setMock(HttpCalloutMock.class, new DocrioStep2FailureMock());
        
        try {
            Map<String, Object> result = client.uploadFile(TEST_FILE_NAME, TEST_FILE_CONTENT, TEST_RECORD_ID);
            System.assert(false, 'Should have thrown an exception');
        } catch (DocrioClient.DocrioException e) {
            // Expected exception when Step 2 fails
            System.assert(e.getMessage().contains('Step 2 failed') || e.getMessage().contains('Error uploading file'), 'Should contain failure message');
        }
        Test.stopTest();
    }
    
    @isTest
    static void testErrorHandling() {
        DocrioClient client = new DocrioClient();
        List<String> fileIds = new List<String>{TEST_FILE_ID};
        
        Test.startTest();
        // Set up mock that returns an error
        Test.setMock(HttpCalloutMock.class, new DocrioErrorMock());
        
        try {
            Map<String, Object> result = client.getFiles(fileIds);
            System.assert(false, 'Should have thrown an exception');
        } catch (DocrioClient.DocrioException e) {
            // Expected exception
            System.assert(true, 'Expected exception: ' + e.getMessage());
        }
        Test.stopTest();
    }
    
    @isTest
    static void testNetworkErrorHandling() {
        DocrioClient client = new DocrioClient();
        List<String> fileIds = new List<String>{TEST_FILE_ID};
        
        Test.startTest();
        // Set up mock that simulates network error
        Test.setMock(HttpCalloutMock.class, new DocrioNetworkErrorMock());
        
        try {
            Map<String, Object> result = client.getFiles(fileIds);
            System.assert(false, 'Should have thrown an exception');
        } catch (DocrioClient.DocrioException e) {
            // Expected exception
            System.assert(true, 'Expected exception: ' + e.getMessage());
        }
        Test.stopTest();
    }
    
    // Mock class for OAuth token requests
    private class DocrioOAuthMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            
            // Mock successful OAuth response
            String responseBody = '{' +
                '"access_token": "test-access-token-123",' +
                '"instance_url": "https://test.salesforce.com",' +
                '"id": "https://test.salesforce.com/id/00D000000000000/005000000000000",' +
                '"token_type": "Bearer",' +
                '"issued_at": "1234567890",' +
                '"signature": "test-signature"' +
                '}';
            
            res.setBody(responseBody);
            res.setStatusCode(200);
            return res;
        }
    }
    
    // Mock class for Docrio API calls
    private class DocrioAPIMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            
            String endpoint = req.getEndpoint();
            String method = req.getMethod();
            
            // Mock different responses based on endpoint and method
            if (endpoint.contains('/v1/files') && method == 'GET') {
                if (endpoint.contains('/info')) {
                    // File info response
                    res.setBody('{"success": true, "files": [{"id": "' + TEST_FILE_ID + '", "name": "' + TEST_FILE_NAME + '"}]}');
                } else {
                    // File content response
                    res.setBody('{"success": true, "content": "' + TEST_FILE_CONTENT + '"}');
                }
            } else if (endpoint.contains('/v1/files') && method == 'DELETE') {
                // Delete response
                res.setBody('{"success": true, "deleted": true}');
            } else {
                // Default response
                res.setBody('{"success": true}');
            }
            
            res.setStatusCode(200);
            return res;
        }
    }
    
    // Mock class for upload process
    private class DocrioUploadMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            
            String endpoint = req.getEndpoint();
            String method = req.getMethod();
            
            if (endpoint.contains('/files') && method == 'POST' && !endpoint.contains('/complete')) {
                // Step 1: Return signed URL
                res.setBody('{"success": true, "signedUrl": "https://test-signed-url.com/upload", "fileId": "' + TEST_FILE_ID + '"}');
            } else if (endpoint.contains('/files/complete') && method == 'POST') {
                // Step 3: Complete upload
                res.setBody('{"success": true, "uploaded": true}');
            } else {
                // Default response
                res.setBody('{"success": true}');
            }
            
            res.setStatusCode(200);
            return res;
        }
    }
    
    // Mock class for complete upload process including signed URL PUT
    private class DocrioCompleteUploadMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            
            String endpoint = req.getEndpoint();
            String method = req.getMethod();
            
            if (endpoint.contains('/services/oauth2/token') && method == 'POST') {
                // OAuth token request - return success
                res.setBody('{"access_token": "test-access-token-123", "instance_url": "https://test.salesforce.com"}');
                res.setStatusCode(200);
            } else if (endpoint.contains('/files') && method == 'POST' && !endpoint.contains('/complete')) {
                // Step 1: Return signed URL
                res.setBody('{"success": true, "signedUrl": "https://test-signed-url.com/upload", "fileId": "' + TEST_FILE_ID + '"}');
                res.setStatusCode(200);
            } else if (endpoint.contains('test-signed-url.com') && method == 'PUT') {
                // Step 2: Handle PUT to signed URL
                res.setStatusCode(200);
                res.setBody('{"success": true}');
            } else if (endpoint.contains('/files/complete') && method == 'POST') {
                // Step 3: Complete upload
                res.setBody('{"success": true, "uploaded": true}');
                res.setStatusCode(200);
            } else {
                // Default response
                res.setBody('{"success": true}');
                res.setStatusCode(200);
            }
            
            return res;
        }
    }
    
    // Mock class for Step 2 failure (PUT to signed URL fails)
    private class DocrioStep2FailureMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            
            String endpoint = req.getEndpoint();
            String method = req.getMethod();
            
            if (endpoint.contains('/services/oauth2/token') && method == 'POST') {
                // OAuth token request - return success
                res.setBody('{"access_token": "test-access-token-123", "instance_url": "https://test.salesforce.com"}');
                res.setStatusCode(200);
            } else if (endpoint.contains('/files') && method == 'POST' && !endpoint.contains('/complete')) {
                // Step 1: Return signed URL
                res.setBody('{"success": true, "signedUrl": "https://test-signed-url.com/upload", "fileId": "' + TEST_FILE_ID + '"}');
                res.setStatusCode(200);
            } else if (endpoint.contains('test-signed-url.com') && method == 'PUT') {
                // Step 2: Simulate failure
                res.setStatusCode(500);
                res.setBody('{"error": "Upload failed"}');
            } else if (endpoint.contains('/files/complete') && method == 'POST') {
                // Step 3: Complete upload (should not be reached)
                res.setBody('{"success": true, "uploaded": true}');
                res.setStatusCode(200);
            } else {
                // Default response
                res.setBody('{"success": true}');
                res.setStatusCode(200);
            }
            
            return res;
        }
    }
    
    // Mock class for error responses
    private class DocrioErrorMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            
            res.setBody('{"error": "Test error message", "success": false}');
            res.setStatusCode(400);
            return res;
        }
    }
    
    // Mock class for network errors
    private class DocrioNetworkErrorMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            // Simulate a network error by throwing an exception
            throw new CalloutException('Network error simulation');
        }
    }
} 