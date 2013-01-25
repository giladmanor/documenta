package wonderland.flow.view
{
	import flash.events.Event;
	
	import spark.components.TextInput;
	
	public class NumericTextInput extends TextInput
	{
		public function NumericTextInput()
		{
			super();
			this.addEventListener(Event.CHANGE,checkNumerosity);
		}
		
		public function set value(o:Number):void{
			this.text = String(o);
			
			
		}
		
		public function get value():Number{
			return Number(this.text);
		}
		
		private function checkNumerosity(e:Event):void{
			if(isNaN(Number(this.text))){
				this.text = "0";
				this.errorString = "Numeric Values Only";
			}else{
				this.errorString = null;
			}
		}
		
		
	}
}