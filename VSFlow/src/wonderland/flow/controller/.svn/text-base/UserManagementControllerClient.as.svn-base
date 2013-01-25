package wonderland.flow.controller
{
	import flash.net.URLVariables;
	
	import wonderland.comm.ControllerClient;
	
	public class UserManagementControllerClient extends ControllerClient
	{
		public function UserManagementControllerClient(srv:String)
		{
			super(srv+"user_manager");
		}
		
		public function setUser(id:Object,
								name:String,
								l_name:String,
								email:String,
								title:String,
								password:String,
								role_id:Object,
								permission_level_id:Object,
								surrogate_id:Object,
								avatar:String,
								signature_image:String,
								group_ids:Array,
								resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["user"] =  new Object();
			d["data"]["user"]["id"] = id;
			d["data"]["user"]["name"] = name;
			d["data"]["user"]["l_name"] = l_name;
			d["data"]["user"]["email"] = email;
			d["data"]["user"]["title"] = title;
			d["data"]["user"]["password"] = password;
			d["data"]["user"]["role_id"] = role_id;
			d["data"]["user"]["permission_level_id"] = permission_level_id;
			d["data"]["user"]["surrogate_id"] = surrogate_id;
			d["data"]["user"]["avatar"] = avatar;
			d["data"]["user"]["signature_image"] = signature_image;
			d["data"]["groups"] = group_ids;
			call("set_user",d,resFunc,failFunc);
		}
		
		public function listUsers(filter:String,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["filter"] = filter;
			call("list_users",d,resFunc,failFunc);
		}
		
		public function deleteUser(id:Number,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["id"] = id;
			call("delete_user",d,resFunc,failFunc);
		}
		
		public function getUserName(id:Object,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["id"] = id;
			call("get_user_name",d,resFunc,failFunc);
		}
		
		public function listGroups(filter:String,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["filter"] = filter;
			call("list_groups",d,resFunc,failFunc);
		}
		
		public function listPermissionLevels(filter:String,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["filter"] = filter;
			call("list_permission_levels",d,resFunc,failFunc);
		}
		
		public function listRoles(filter:String,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["filter"] = filter;
			call("list_roles",d,resFunc,failFunc);
		}
		
		public function getAvatar(id:Number,resFunc:Function,failFunc:Function):void{
			getBinary("get_avatar",id,resFunc,failFunc);
		}
		
		public function getSignatureImage(id:Number,resFunc:Function,failFunc:Function):void{
			getBinary("get_signature_image",id,resFunc,failFunc);
		}
		
	}
}