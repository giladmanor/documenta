package wonderland.flow.module
{
	
	
	
	
	
	import com.adobe.serialization.json.JSON;
	
	import mx.modules.Module;
	
	
	
	public class STDModule extends Module implements ISTDModule
	{
		[Event(name="menuevent.open", type="wonderland.flow.view.MenuEvent")]
		
		[Bindable] public var server:String;
		[Bindable] public static var thisInstance:STDModule;
		[Bindable] protected var paramData:Object;
		[Bindable] protected var readOnly:Boolean = true;
		[Bindable] protected var loggedUserName:String;
		[Bindable] protected var loggedUserID:Number;
		
		
		
		public function STDModule()
		{
			super();
			thisInstance = this;
			
		}
		
		public function set serverURL(v:String):void
		{
			server = v;
		}
		
		public function set params(data:Object):void
		{
			if(data!=null && !(data.hasOwnProperty("type_id") && data["type_id"]=="null") ){
				paramData = JSON.decode(String(data));	
			}
			
		}
		
		public function set can_change(b:Boolean):void
		{
			readOnly = !b;
		}
		
		public function set userName(o:String):void{
			loggedUserName = o;
		}
		
		public function set userID(o:Number):void{
			loggedUserID = o;
		}
		
		
		
		
		
		
	}
}