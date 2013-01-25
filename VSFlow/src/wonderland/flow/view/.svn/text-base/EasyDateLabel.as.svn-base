package wonderland.flow.view
{
	import mx.controls.DateField;
	import mx.controls.Label;
	
	public class EasyDateLabel extends Label
	{
		[Bindable] public var dateFormatString:String = 'YYYY-MM-DD';
		[Bindable] public var dateTimeDelimitter:String = 'T';
		
		public function EasyDateLabel()
		{
			super();
			
		}
		
		public function set selectedDateString(value:String):void{
			var d:Date = DateField.stringToDate(value.substring(0,value.indexOf(dateTimeDelimitter)),dateFormatString);
			this.text = d.toLocaleDateString();
		}
	
	}
}