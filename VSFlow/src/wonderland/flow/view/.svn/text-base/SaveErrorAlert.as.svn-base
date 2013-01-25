package wonderland.flow.view
{
	import mx.controls.Alert;

	
	public class SaveErrorAlert 
	{
		public function SaveErrorAlert()
		{
			
		}
		
		
		static public function show(message:Object,title:String):void{
			var s:String = "";
			for (var k:String in message){
				s += (message[k] as Array)[0] +"\n";
			}
			
			Alert.show(s,title);
		}
	}
}