package wonderland.flow.module
{
	public interface ISTDModule
	{
		function set serverURL(v:String):void;
		function set params(data:Object):void;
		function set can_change(b:Boolean):void;
		function set userName(o:String):void;
		function set userID(o:Number):void;
	}
}