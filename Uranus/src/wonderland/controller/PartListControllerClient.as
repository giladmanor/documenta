package wonderland.controller
{
	import com.adobe.serialization.json.JSON;
	
	import mx.rpc.events.ResultEvent;
	
	import wonderland.flow.controller.GenericListControllerClient;
	
	public class PartListControllerClient extends GenericListControllerClient
	{
		public function PartListControllerClient(srv:String)
		{
			super(srv+"part_manager");
			loadList(GROUPS,VENDORS,CUSTOMERS,PART_STATUS);
		}
		
		public const GROUPS:Array = ["groups",groupResult];
		[Bindable] public var groupDP:Array;
		private function  groupResult(e:ResultEvent):void{groupDP = JSON.decode(String(e.result));}
		
		public const VENDORS:Array = ["vendors",vendorsResult];
		[Bindable] public var vendorsDP:Array;
		private function  vendorsResult(e:ResultEvent):void{vendorsDP = JSON.decode(String(e.result));}

		public const CUSTOMERS:Array = ["customers",customersResult];
		[Bindable] public var customersDP:Array;
		private function  customersResult(e:ResultEvent):void{customersDP = JSON.decode(String(e.result));}

		public const PART_STATUS:Array = ["part_version_stats",part_modesResult];
		[Bindable] public var part_modesDP:Array;
		private function  part_modesResult(e:ResultEvent):void{part_modesDP = JSON.decode(String(e.result));}
		
		
		
	}
}