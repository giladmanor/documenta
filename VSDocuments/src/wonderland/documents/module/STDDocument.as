package wonderland.documents.module
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	import mx.charts.chartClasses.StackedSeries;
	import mx.collections.ArrayCollection;
	import mx.controls.CheckBox;
	import mx.controls.ComboBox;
	import mx.controls.DateField;
	import mx.controls.TextArea;
	import mx.controls.TextInput;
	import mx.core.Container;
	import mx.core.UIComponent;
	import mx.core.UIComponentDescriptor;
	
	import spark.components.Group;
	import spark.components.VGroup;
	
	import wonderland.documents.view.IDocumentList;
	import wonderland.flow.view.EasyDateField;
	import wonderland.flow.view.ISTDSingleSelector;
	import wonderland.flow.view.UserSelector;
	import wonderland.view.Gear;
	
	public class STDDocument extends VGroup implements ISTDDocument
	{
		
		[Bindable]protected var cLog:Object;
		[Bindable]protected var doc:Object;
		[Bindable]protected var version:Object;
		[Bindable]protected var server:String;
		[Bindable]protected var isReadOnly:Boolean;
		[Bindable]protected var fileSystemFilters:String;
		[Bindable]protected var availableDocStatsDP:Array;
		
		protected var childNameMin:uint = 0;
		protected var childNameMax:uint = 1;
		
		public function STDDocument()
		{
			super();
			clipAndEnableScrolling=true;
			
		}
		
		public function set changeLog(data:Object):void{
			cLog = data;
		}
		
		public function set serverURL(v:String):void{
			server = v;
		}
		
		public function set documentData(data:Object):void{
			doc = data;
		}
		
		public function set documentVersionData(data:Object):void{
			version = data;
		}
		
		public function set readOnly(b:Boolean):void{
			isReadOnly = b;
		}
		
		public function get printableObjects():Array{
			var objList:Array = new Array();
			for (var i:int = 0;i<this.numElements;i++)
			{
				var comp:UIComponent = this.getElementAt(i) as UIComponent;
				if(comp.visible){
					objList.push(comp);	
				}
				
			}
			
			return objList;
		}
		
		public function init():void{
			//Do nothing here
		}
		
		public function set fileFilters(f:String):void{
			fileSystemFilters = f;
		}
		
		public function set availableDocStats(a:Array):void{
			availableDocStatsDP = a;
		}
		
		public function get data():Object{
			var res:Object = new Object();
			for (var i:uint = childNameMin; i <= childNameMax; i++){
				var cd:Object = getChildData(String(i));
				if(cd!=null){
					res["c"+i] = cd;	
				}
			}
			return res;
		}
		
		public function get doc_stat_id():Number{
			return 0;
		}
		
		public function set data(o:Object):void{
			emptyForm();
			for (var i:String in o){
				setChildData(i.substring(1),o[i]);
			}
		}
		
		private function emptyForm():void{
			for (var i:uint = childNameMin; i <= childNameMax; i++){
				var cd:Object = getChildData(String(i));
				setChildData(String(i),null);
			}
		}
		
		/////////////////////////////////////////////////////////////////////////////////////////////
		
		protected function getChildData(childName:String):*{
			var c:* = getChildByNameRecursive(childName,this);
			
			if (c is spark.components.TextInput){
				return (c as spark.components.TextInput).text;
			}else if (c is TextInput){
				return (c as TextInput).text;
			}else if(c is ComboBox){
				if((c as ComboBox).selectedItem){
					return (c as ComboBox).selectedItem["id"];	
				}else{
					return null;
				}
			}else if (c is TextArea){
				return (c as TextArea).text;
			}else if(c is CheckBox){
				return (c as CheckBox).selected;
			}else if (c is DateField){
				if((c as DateField).selectedDate){
					return (c as DateField).selectedDate;//.toUTCString();	
				}else{
					return null;
				}
			}else if (c is IDocumentList){
				return (c as IDocumentList).documents;
			}else if(c is ISTDSingleSelector){
				return (c as ISTDSingleSelector).selected;
			}
			return null;
		}
		
		protected function setChildData(childName:String,value:Object):void{
			var c:* = getChildByNameRecursive(childName,this);
			
			if (value == null || value == "null"){
				value = "";
			}
			
			if (c is spark.components.TextInput){
				(c as spark.components.TextInput).text = String(value);
			}else if (c is TextInput){
				(c as TextInput).text = String(value);
			}else if(c is ComboBox){
				var dp:Array = ((c as ComboBox).dataProvider as ArrayCollection).source;
				for each (var i:Object in dp){
					if (i!=null && i["id"]== value){
						(c as ComboBox).selectedItem = i;
					}
				}
			}else if (c is TextArea){
				(c as TextArea).text = String(value);
			}else if(c is CheckBox){
				(c as CheckBox).selected = value=="true" ? true : false;
			}else if (c is EasyDateField){
				(c as EasyDateField).selectedDateString = String(value);
			}else if (c is IDocumentList){
				if (value!=null && value.hasOwnProperty("item")){
					(c as IDocumentList).documents = value["item"] as Array;	
				}
			}else if(c is ISTDSingleSelector){
				(c as ISTDSingleSelector).selected = value;
			}
			
		}
		
		// Utility method for recursivley inspecting a container for a getChildByName
		// source: http://www.lucamarchesini.com/bRain/index.php?option=com_content&view=article&id=57:flex-recursive-getchildbyname&catid=38:entries&Itemid=67
		private function getChildByNameRecursive(name:String, container:DisplayObjectContainer):*{
			var child:DisplayObject = container.getChildByName(name);
			if (child){
				return child;
			}
				
			for (var i:uint=0; i < container.numChildren; i++) {
				if (container.getChildAt(i) is DisplayObjectContainer){
					child = getChildByNameRecursive(name, container.getChildAt(i) as DisplayObjectContainer);
					if (child){
						return child;
					}
				}
			}
			
			return child;
		}
		/////////////////////////////////////////////////////////////////////////////////////////////////
		private var gear:Gear;
		public function set showLoader(b:Boolean):void{
			initGear();
			gear.visible = b;
			gear.doRunRun = b;
		}
		
		private function initGear():void{
			if(gear==null){
				gear = new Gear();
				gear.width = gear.height = 200;
				gear.x = this.width/2 -100;
				gear.y = this.height/2 -100;
				gear.alpha = 0.8;
				this.addElement(gear);
			}
		}
		
	}
}