package wonderland.controller
{
	import com.adobe.serialization.json.JSON;
	import mx.rpc.events.ResultEvent;
	import wonderland.flow.controller.GenericListControllerClient;
	
	public class DocumentListControllerClient extends GenericListControllerClient
	{
		
		public function DocumentListControllerClient(srv:String){
			super(srv+"document_manager");
		}
		
		public const CUSTOMERS:Array = ["customers",customersResult];
		public const ORIGINATORS:Array = ["originators",originatorsResult];
		public const SELLERS:Array = ["sellers",sellersResult];
		public const REQUEST_TYPES:Array = ["request_types",requestTypesResult];
		public const PERM_TEMPS:Array = ["perm_temps",permTempsResult];
		public const D_CLASSES:Array = ["d_classes",dClassesResult];
		public const PRIORITIES:Array = ["priorities",prioritiesResult];
		public const ORIGINES:Array = ["origines",originesResult];
		public const CATEGORIES:Array = ["categories",categoriesResult];
		public const RECURANCES:Array = ["recurances",recurancesResult];
		public const VENDORS:Array = ["vendors",vendorsResult];
		public const DOC_STATS:Array = ["doc_stats",docStatsResult];
		public const DISPOSITIONS:Array = ["dispositions",dispositionResult];
		public const SIGNATURE_TYPES:Array = ["signature_types",signatureTypeResult];
		
		[Bindable] public var customersDP:Array;
		[Bindable] public var originatorsDP:Array;
		[Bindable] public var sellersDP:Array;
		[Bindable] public var requestTypesDP:Array;
		[Bindable] public var permTempsDP:Array;
		[Bindable] public var dClassesDP:Array;
		[Bindable] public var prioritiesDP:Array;
		[Bindable] public var originesDP:Array;
		[Bindable] public var categoriesDP:Array;
		[Bindable] public var recurancesDP:Array;
		[Bindable] public var vendorsDP:Array;
		[Bindable] public var docStatsDP:Array;
		[Bindable] public var dispositionsDP:Array;
		[Bindable] public var signature_typesDP:Array;
				
		private function  customersResult(e:ResultEvent):void{customersDP = JSON.decode(String(e.result));}
		private function  originatorsResult(e:ResultEvent):void{originatorsDP = JSON.decode(String(e.result));}
		private function  sellersResult(e:ResultEvent):void{sellersDP = JSON.decode(String(e.result));}
		private function  requestTypesResult(e:ResultEvent):void{requestTypesDP = JSON.decode(String(e.result));}
		private function  permTempsResult(e:ResultEvent):void{permTempsDP = JSON.decode(String(e.result));}
		private function  dClassesResult(e:ResultEvent):void{dClassesDP = JSON.decode(String(e.result));}
		private function  prioritiesResult(e:ResultEvent):void{prioritiesDP = JSON.decode(String(e.result));}
		private function  originesResult(e:ResultEvent):void{originesDP = JSON.decode(String(e.result));}
		private function  categoriesResult(e:ResultEvent):void{categoriesDP = JSON.decode(String(e.result));}
		private function  recurancesResult(e:ResultEvent):void{recurancesDP = JSON.decode(String(e.result));}
		private function  vendorsResult(e:ResultEvent):void{vendorsDP = JSON.decode(String(e.result));}
		private function  docStatsResult(e:ResultEvent):void{docStatsDP = JSON.decode(String(e.result));}
		private function  dispositionResult(e:ResultEvent):void{dispositionsDP = JSON.decode(String(e.result));}
		private function  signatureTypeResult(e:ResultEvent):void{signature_typesDP = JSON.decode(String(e.result));}
		
		public const TAGS:Array = ["tags",tagsResult];
		[Bindable] public var tagsDP:Array;
		private function  tagsResult(e:ResultEvent):void{tagsDP = JSON.decode(String(e.result));}
		
		public const GROUPS:Array = ["groups",groupResult];
		[Bindable] public var groupDP:Array;
		private function  groupResult(e:ResultEvent):void{groupDP = JSON.decode(String(e.result));}
		
		public const PERMISSION_LEVELS:Array = ["permission_levels",permission_levelsResult];
		[Bindable] public var permission_levelsDP:Array;
		private function  permission_levelsResult(e:ResultEvent):void{permission_levelsDP = JSON.decode(String(e.result));}
		
		public const DOC_TYPES:Array = ["doc_types",docTypeResult];
		[Bindable] public var doc_typesDP:Array;
		private function  docTypeResult(e:ResultEvent):void{doc_typesDP = JSON.decode(String(e.result));}
		
		
	}
}