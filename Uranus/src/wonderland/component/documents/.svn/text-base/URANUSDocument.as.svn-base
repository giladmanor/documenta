package wonderland.component.documents
{
	import com.adobe.serialization.json.JSON;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import wonderland.controller.DocumentListControllerClient;
	import wonderland.documents.controller.DocumentControllerClient;
	import wonderland.documents.module.STDDocument;
	
	public class URANUSDocument extends STDDocument  
	{
		[Bindable]protected var listCnt:DocumentListControllerClient
		protected var cnt:DocumentControllerClient;
		protected var tempData:Object;
		[Bindable]protected var listsLoaded:Boolean = false;
		[Bindable] protected var selectedDocStatID:Number;
		
		protected var loadBlobWithVersion:Boolean = true;
		
		public function URANUSDocument()
		{
			super();
		}
		
		protected function loadData(... args):void{
			cnt = new DocumentControllerClient(server);
			listsLoaded = false;
			listCnt.addEventListener(Event.COMPLETE,engageData);
			listCnt.load(args);	
			if (version!=null && loadBlobWithVersion && !isNaN(version["id"])){
				tempData = null;
				showLoader = true;
				cnt.getDocumentData(version["id"],getDataResult,fault);
			}
			
			
		}
		
		protected function engageData(e:Event):void{
			listsLoaded = true;
			showLoader = false;
			if(tempData!=null){
				this.data = tempData;
				
			}
			selectedDocStatID = version['doc_stat_id'];
			
		}
		
		private function getDataResult(e:ResultEvent):void{
			tempData = JSON.decode(String(e.result));
			if(listsLoaded){
				engageData(null);
			}
			
		}
		
		private function fault(e:FaultEvent):void{
			Alert.show(e.fault.message,"Server Error");
			showLoader = false;
		}
	}
}