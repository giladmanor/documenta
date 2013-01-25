package wonderland.comm
{
	import com.adobe.serialization.json.JSON;
	
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class CloudAPI
	{
		public function CloudAPI()
		{
		}
		
		public function googleSearch(s:String, resultFunc:Function):void 
		{
			//http://code.google.com/apis/websearch/docs/reference.html#_intro_fonje
			var service:HTTPService = new HTTPService();
			service.url = 'http://ajax.googleapis.com/ajax/services/search/web';
			service.request.v = '1.0';
			service.request.q = s;
			service.request.rsz = "large";
			service.resultFormat = 'text';
			service.addEventListener(ResultEvent.RESULT, resultFunc);
			service.send();
		}
		
		public function twitterSearch(s:String, resultFunc:Function):void 
		{
			var service:HTTPService = new HTTPService();
			service.url = 'http://search.twitter.com/search.json?q='+s;
			service.request.v = '1.0';
			service.request.q = s;
			service.resultFormat = 'text';
			service.addEventListener(ResultEvent.RESULT, resultFunc);
			service.send();
		}
			
		//http://code.google.com/apis/youtube/2.0/developers_guide_protocol.html#Retrieving_and_searching_for_videos
		public function youtubeSearch(s:String, resultFunc:Function):void 
		{
			var service:HTTPService = new HTTPService();
			service.url = 'https://gdata.youtube.com/feeds/api/videos?q='+s+'&orderby=published&start-index=11&max-results=10&v=2';
			service.request.v = '1.0';
			service.request.q = s;
			service.resultFormat = 'text';
			service.addEventListener(ResultEvent.RESULT, resultFunc);
			service.send();
		}
		
	}
}