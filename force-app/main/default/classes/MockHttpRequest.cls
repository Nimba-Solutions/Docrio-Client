@isTest
global class MockHttpRequest implements HttpCalloutMock {

    global HTTPResponse respond(HTTPRequest req) {
       
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        
            String body = req.getBody();
            String[] bodySplit = body.split('=');
            if(body != null && bodySplit.size() == 2 && bodySplit[0] == 'secret' && bodySplit[1] != null && bodySplit[1] != '' ){
                res.setBody('{'+
                            ' "success": true'+
                            '}'); 
                
                res.setStatusCode(200);
            }
            else
            {
                res.setBody('{'+
                            ' "success": false'+
                            '}');
                
                res.setStatusCode(400);
            }
        return res;
    }
}