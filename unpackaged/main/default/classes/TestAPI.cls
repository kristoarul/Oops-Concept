public class TestAPI {

    public String created_at;
    public string icon_url;
    public string id;
    public string url;
    public string value;
    
    public static void TEST(){
        http h = new http();
        httprequest res = new httprequest();
        res.setEndpoint('https://api.chucknorris.io');
        res.setmethod('GET');
    httpresponse response = h.send(res);
        if(response.getStatusCode()==200){
            //system.debug('TEST'+TestAPI.id);
        }
        system.debug(response);
        
    }
    
}