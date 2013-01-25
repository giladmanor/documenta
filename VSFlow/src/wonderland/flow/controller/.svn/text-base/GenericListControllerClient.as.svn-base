package wonderland.flow.controller
{
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	
	import wonderland.comm.ControllerClient;
	
	
	// LSD complient generic list request
	public class GenericListControllerClient extends ControllerClient
	{
		private var completionCounter:uint = 0;
		
		public function GenericListControllerClient(srv:String)
		{
			super(srv);
		}
		
		public function loadList(... arr):void{
			load(arr);
		}
		
		public function load(preloadArray:Array):void{
			completionCounter = preloadArray.length;
			for (var i:uint = 0; i < preloadArray.length; i++){
				//preloadArray[i] = ["entity_plural_name",resultHandlingFunction]
				list(preloadArray[i][0],preloadArray[i][1]);
				
			}
			
		}
		
		public function list(entity_plural:String,resFunc:Function,failFunc:Function=null):void{
			var d:Object = new Object();
			d["data"] = new Object();
			
			if (failFunc!=null){
				call("list_"+entity_plural,d,resFunc,failFunc);	
			}else{
				call("list_"+entity_plural,d,resFunc,fault);
			}
			this.addEventListener("tick",registerTick);
		}
		
		private function registerTick(e:Event):void{
			completionCounter--;
			if (completionCounter<=0){
				this.dispatchEvent(new Event(Event.COMPLETE));
			}
		}
		
		private function fault(e:FaultEvent):void{
			Alert.show(e.fault.message,"Server Error");
		}
		
		
		
		
	}
}