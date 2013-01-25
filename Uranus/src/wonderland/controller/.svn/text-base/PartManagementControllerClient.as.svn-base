package wonderland.controller
{
	import wonderland.comm.ControllerClient;
	
	public class PartManagementControllerClient extends ControllerClient
	{
		public function PartManagementControllerClient(srv:String)
		{
			super(srv+"part_manager");
		}
		
		
		public function listAssemblies(id:Number,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["id"] = id;
			
			call("list_assemblies_for_part_version",d,resFunc,failFunc);
		}
		
		public function listParts(search:String,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["search"] = search;
			
			call("list_parts",d,resFunc,failFunc);
		}
		
		public function getPartVersionInfo(id:Number,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["id"] = id;
			
			call("get_part_version_info",d,resFunc,failFunc);
		}
		
		public function setPartVersion(data:Object,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = data;
			call("set_part_version",d,resFunc,failFunc);
			
		}
		
	}
}