package wonderland.flow.controller
{
	import wonderland.comm.ControllerClient;
	
	public class LoginControllerClient extends ControllerClient
	{
		public function LoginControllerClient(srv:String)
		{
			super(srv+"session");
		}
		
		public function login(email:String,password:String,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["user"] = new Object();
			d["user"]["email"] = email;
			d["user"]["password"] = password;
			call("login",d,resFunc,failFunc);
		}
		
		public function requestPassword(email:String,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["user"] = new Object();
			d["user"]["email"] = email;
			call("request_password",d,resFunc,failFunc);
		}
		
		
		public function changePassword(oldPassword:String,newPassword:String,resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			d["data"]["old"] = oldPassword;
			d["data"]["new"] = newPassword;
			call("change_password",d,resFunc,failFunc);
		}
		
		public function listFavMenu(resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			call("list_fav_menu",d,resFunc,failFunc);
		}
		
		public function getDeploymentStamp(resFunc:Function,failFunc:Function):void{
			var d:Object = new Object();
			d["data"] = new Object();
			call("deployment_stamp",d,resFunc,failFunc);
		}
		
		
	}
}