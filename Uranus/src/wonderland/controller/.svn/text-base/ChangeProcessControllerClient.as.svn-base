package wonderland.controller
{
	import wonderland.comm.ControllerClient;
	
	public class ChangeProcessControllerClient extends ControllerClient
	{
		public function ChangeProcessControllerClient(srv:String)
		{
			super(srv+"process_manager");
		}
		
		public function listChangeProcesses(search:String,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["search"] = search;
			
			call("list_change_processes",d,resFunc,failFunc);
		}
		
		public function listChangeProcessLogs(id:Number,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["id"] = id;
			
			call("list_change_process_logs",d,resFunc,failFunc);
		}
		
		public function approveChangeProcesses(id:Number,comment:String,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["comment"] = comment;
			d["data"]["id"] = id;
			
			call("approve_change_processes",d,resFunc,failFunc);
		}
		
		public function rejectChangeProcesses(id:Number,comment:String,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["comment"] = comment;
			d["data"]["id"] = id;
			
			call("reject_change_processes",d,resFunc,failFunc);
		}
		
		public function delegateChangeProcesses(id:Number,comment:String,recipient_id:Object,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["comment"] = comment;
			d["data"]["id"] = id;
			d["data"]["recipient_id"] = recipient_id;
			
			call("delegate_change_processes",d,resFunc,failFunc);
		}
		
		public function setProcess(id:Object,title:String,comment:String,recipient_ids:Array,document_ids:Array,document_version_id:Number,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["document_version_id"] = document_version_id;
			d["data"]["change_process"] = new Object();
			d["data"]["change_process"]["desc"] = comment;
			d["data"]["change_process"]["title"] = title;
			d["data"]["change_process"]["id"] = id;
			d["data"]["recipient_ids"] = recipient_ids;
			d["data"]["document_ids"] = document_ids;
			
			call("set_change_process",d,resFunc,failFunc);
		}
		
		
	}
}