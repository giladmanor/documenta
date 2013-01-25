package wonderland.comm
{
	import com.adobe.serialization.json.JSON;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ControllerClient extends EventDispatcher
	{
		
		protected var server:String;
		
		protected var services:Object = new Object();
		protected var cnt:ControllerClient;
		
		
		public function ControllerClient(srv:String){
			server = srv;	
			
		}
		
		public function callGet(action:String,args:Object,resFunc:Function, failFunc:Function,resultFromat:String="e4x"):void{
			var service:HTTPService;
			service = new HTTPService();
			service.url = server+"/"+action;
			service.method = "GET";
			service.resultFormat = resultFromat;
			service.addEventListener(ResultEvent.RESULT,resFunc);
			service.addEventListener(ResultEvent.RESULT,completeNotification);
			service.addEventListener(FaultEvent.FAULT, failFunc);
			service.send(args);
			
		}
		
		
		public function call(action:String,args:Object,resFunc:Function, failFunc:Function,resultFromat:String="e4x"):void{
			var service:HTTPService;
			if(services.hasOwnProperty(action)){
				service = services[action];
			}else{
				service = new HTTPService();
				service.url = server+"/"+action;
				service.method = "POST";
				service.contentType = "application/xml";
				service.resultFormat = resultFromat;
				service.useProxy = false;
				service.addEventListener(ResultEvent.RESULT,resFunc);
				service.addEventListener(ResultEvent.RESULT,completeNotification);
				service.addEventListener(FaultEvent.FAULT, failFunc);
				services[action] = service;
				
			}
			
			service.send(args);
			
		}
		
		private function completeNotification(e:ResultEvent):void{
			this.dispatchEvent(new Event("tick"));
		}
		
		public function getBinary(action:String,id:Object,resFunc:Function, failFunc:Function, format:String = URLLoaderDataFormat.BINARY):void{
			var loader:URLLoader = new URLLoader();
			loader.dataFormat = format;
			var request:URLRequest = new URLRequest();
			request.method = "GET";
			var d:URLVariables = new URLVariables();
			d.id = id;
			request.data = d;
			request.url = server+"/"+action;
			request.contentType = "text/xml";
			loader.addEventListener(Event.COMPLETE,resFunc);
			//loader.addEventListener(IOErrorEvent.IO_ERROR,failFunc);
			
			loader.load(request);
			
		}
		
		
		
		
	}
}