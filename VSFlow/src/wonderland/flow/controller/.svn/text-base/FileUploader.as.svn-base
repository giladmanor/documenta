package wonderland.flow.controller
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	
	import mx.controls.Alert;
	import mx.core.mx_internal;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.Base64Encoder;
	
	import wonderland.comm.ControllerClient;

	public class FileUploader extends EventDispatcher
	{
		public static const IMAGE:FileFilter = new FileFilter("Images (*.jpg, *.jpeg, *.gif, *.png)", "*.jpg; *.jpeg; *.gif; *.png");
		public static const TEXT:FileFilter = new FileFilter("Text Files (*.txt, *.rtf)", "*.txt; *.rtf");
		public static const DOCUMENT:FileFilter = new FileFilter("Documents (*.pdf, *.doc, *.docx)", "*.pdf; *.doc; *.docx");
		public static const ALL:FileFilter = new FileFilter("All Files (*.*)", "*.*");
		
		protected var serverURL:String;
		protected var requestAction:String;
		protected var requestId:Object;
		protected var cnt:ControllerClient;
		
		private var fileRef:FileReference;
		
		public function upload(server:String,action:String,id:Object, fileTypes:FileFilter):void{
			this.serverURL = server;
			this.requestAction = action;
			this.requestId = id;
			
			var allTypes:Array = new Array(fileTypes);
			try{
				fileRef = new FileReference();
				fileRef.addEventListener(Event.SELECT, selectHandler);
				fileRef.addEventListener(Event.COMPLETE, completeHandler);
				
				fileRef.browse(allTypes);	
			}catch(error:Error){
				trace("Unable to browse for files. " + error);
			}
		}
		
		private function selectHandler(e:Event):void{
			cnt = new ControllerClient(serverURL);
			var d:Object = new Object();
			d["data"] = new Object();
			cnt.call("get_session_token",d,getTokenResult,fault);
		}
		
		private function getTokenResult(e:ResultEvent):void{
			var token:String = String(e.result);
			var requestURL:String =  serverURL + requestAction + requestId+"?token="+token;
			
			var request:URLRequest = new URLRequest(requestURL);
			try
			{
				fileRef.upload(request);
			}
			catch (error:Error)
			{
				
			}
		}
			
		private function fault(e:FaultEvent):void{
			this.dispatchEvent(new Event("error"));
		}
		
		private function completeHandler(e:Event):void{
			this.dispatchEvent(new Event(e.type));
		}
		
		public function get uploadedFileName():String{
			return fileRef.name;
		}
		
		public static function fileTypes(label:String, types:String):FileFilter{
			return new FileFilter(label + "("+types+")", types);
		}
	}
}