package wonderland.documents.controller
{
	import wonderland.comm.ControllerClient;
	
	public class DocumentDataControllerClient extends ControllerClient
	{
		public function DocumentDataControllerClient(srv:String)
		{
			super(srv+"document_manager");
		}
		
		public function getDocumentData(id:Number,resFunc:Function,failFunc:Function):void{
			getBinary("get_document_data",id,resFunc,failFunc);
		}
		
		
		
	}
}