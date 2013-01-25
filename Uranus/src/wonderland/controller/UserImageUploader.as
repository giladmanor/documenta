package wonderland.controller
{
	import wonderland.flow.controller.FileUploader;
	
	public class UserImageUploader extends FileUploader
	{
		public function UserImageUploader(serverURL:String)
		{
			super();
			this.serverURL = serverURL+"user_manager";
		}
		
		public function uploadUserAvatar(id:Number):void{
			upload(serverURL,"/set_avatar/",id,IMAGE);
		}
		
		public function uploadUserSignature(id:Number):void{
			upload(serverURL,"/set_signature_image/",id,IMAGE);
		}
		
		
		
		
		
	}
}