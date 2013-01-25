package wonderland.documents.controller
{
	import flash.net.URLLoaderDataFormat;
	
	import wonderland.comm.ControllerClient;
	
	public class DocumentControllerClient extends ControllerClient
	{
		public function DocumentControllerClient(srv:String)
		{
			super(srv+"document_manager");
		}
		
		public function listTags(resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			call("list_tags",d,resFunc,failFunc);
		}
		
		public function listDocTypes(resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			call("list_doc_types",d,resFunc,failFunc);
		}
		
		public function listDocStats(resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			call("list_doc_stats",d,resFunc,failFunc);
		}
		
		public function listPermissionLevels(resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			call("list_permission_levels",d,resFunc,failFunc);
		}
		
		public function listGroups(resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			call("list_groups",d,resFunc,failFunc);
		}
		
		public function listDocuments(search:String,groupId:Object, typeId:Object, authorId:Object, statusId:Object,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["search"] = search;
			d["data"]["group_id"] = groupId;
			d["data"]["doc_type_id"] = typeId;
			d["data"]["user_id"] = authorId;
			d["data"]["doc_stat_id"] = statusId;
			
			call("list_documents",d,resFunc,failFunc);
		}
		
		public function listDocumentVersions( documentId:Number,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["id"] = documentId;
			
			call("list_document_versions",d,resFunc,failFunc);
		}
		
		public function setDocument( doc_data:Object, doc_version_data:Object,blob:Object,groups_data:Array,tags_data:Array,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["blob"] = blob;
			d["data"]["doc_data"] = doc_data;
			d["data"]["doc_version_data"] = doc_version_data;
			d["data"]["groups_data"] = groups_data;
			d["data"]["tags_data"] = tags_data;
			
			
			call("set_document",d,resFunc,failFunc);
		}
		
		public function listDocumentVersionsByArray( a:Array,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["doc_versions"] = a;
			
			call("list_document_versions_by_id_array",d,resFunc,failFunc);
		}
		
		public function getDocumentData(id:Number,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["id"] = id;
			call("get_document_blob",d,resFunc,failFunc,"text");
			
		
		}
	}
}