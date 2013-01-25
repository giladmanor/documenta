package wonderland.documents.controller
{
	import flash.net.FileFilter;
	
	import wonderland.flow.controller.FileUploader;
	
	public class DocumentDataUploader extends FileUploader
	{
		public function DocumentDataUploader(serverURL:String)
		{
			super();
			this.serverURL = serverURL+"document_manager";
		}
		
		public function uploadDocumentData(id:Number, fileFilter:String=null):void{
			var filter:FileFilter = IMAGE;
			if(fileFilter!=null){
				filter = FileUploader.fileTypes("",fileFilter);
			}
			upload(serverURL,"/set_document_data/",id,filter);
		}
		
	}
}