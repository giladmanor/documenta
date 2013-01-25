package wonderland.flow.view
{
	import mx.controls.DateField;
	
	public class EasyDateField extends DateField
	{
		[Bindable] public var dateFormatString:String = 'YYYY-MM-DD';
		[Bindable] public var dateTimeDelimitter:String = 'T';
		
		public function EasyDateField()
		{
			super();
			this.showToday = true;
			this.yearNavigationEnabled=true;
		}
		
		public function set selectedDateString(value:String):void{
			var d:Date;
			if(value.indexOf(dateTimeDelimitter)>0){
				d= DateField.stringToDate(value.substring(0,value.indexOf(dateTimeDelimitter)),dateFormatString);
			}else{
				d= DateField.stringToDate(value,dateFormatString);
			}
			
			this.selectedDate = d;
		}
	}
}