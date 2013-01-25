package wonderland.documents.view
{
	import flash.events.IEventDispatcher;

	public interface IDocumentList extends IEventDispatcher
	{
		function set documents(a:Array):void;
		function get documents():Array;
	}
	
}