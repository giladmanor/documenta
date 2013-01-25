package wonderland.flow.view
{
	import mx.controls.Alert;
	
	public class ServerErrorAlert extends Alert
	{
		public function ServerErrorAlert()
		{
			super();
		}
		static public function say(message:Object):void{
			Alert.show(String(message["error"]),"Server Error");
		}
	}
}