package wonderland.documents.module
{
	import flash.events.IEventDispatcher;
	
	public interface ISTDDocument extends IEventDispatcher
	{
		function set serverURL(v:String):void;
		
		function set changeLog(data:Object):void;
		function set documentData(data:Object):void;
		function set documentVersionData(data:Object):void;
		function set readOnly(b:Boolean):void;
		function set fileFilters(f:String):void;
		function set availableDocStats(a:Array):void;
		
		function init():void;
		
		function get printableObjects():Array;
		
		function get data():Object;
		function get doc_stat_id():Number;
		
		function set data(o:Object):void;
		
		
	}
}