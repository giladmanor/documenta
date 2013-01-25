package wonderland.view
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.states.OverrideBase;
	
	public class Gear extends UIComponent
	{
		private var gx:Number;
		private var gy:Number;
		private var gsides:Number;
		private var ginnerRadius:Number;
		private var gouterRadius:Number;
		private var gangle:Number;
		
		private var isOn:Boolean = false;
		public var hasShadow:Boolean = false;
		public var speed:Number = 1;	
		
		[Bindable] public var lineColor:uint = 0xBBBBBB;
		[Bindable] public var fillColor:uint = 0xDDDDDD;
		
		
		
		public function Gear()
		{
			super();
			
			this.setStyle("backgroundAlpha","0");
			this.addEventListener(FlexEvent.CREATION_COMPLETE,init);
		}
		
		private function init(e:Event):void{
			var gap:Number = width/4;
			gangle = 0;
			gx=width/2;
			gy=height/2;
			gsides = 8;
			ginnerRadius=width/2  ;
			gouterRadius=width/2 +gap;
					
			nudge();
			//start();
			
		}
		
		override protected function updateDisplayList(unscaledWidth:Number,unscaledHeight:Number):void{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			if(isOn){
				nudge();	
			}
			this.callLater(this.invalidateDisplayList);
		}
		
		
		public function start(e:Event=null):void{
			isOn=true;
		}
		
		public function stop(e:Event=null):void{
			isOn=false;
		}
		
		public function set doRunRun(b:Boolean):void{
			isOn = b;
		}
		
		public function get doRunRun():Boolean{
			return isOn;
		}
		
		private function nudge(e:Event=null):void{
			gangle =(gangle+(7* speed))%360 ;
			graphics.clear();
			if(hasShadow){
				drawGear(gx+3,gy+3,gsides,ginnerRadius,gouterRadius,gangle,true); 	
			}
			drawGear(gx,gy,gsides,ginnerRadius,gouterRadius,gangle); 
		}
		
		private function drawGear(x:Number, y:Number, sides:Number, innerRadius:Number, outerRadius:Number, angle:Number, isShadow:Boolean=false):void{
			// ==============
			// mc.drawGear() - by Ric Ewing (ric@formequalsfunction.com) - version 1.3 - 3.5.2002
			// 
			// x, y = center of gear.
			// sides = number of teeth on gear. (must be > 2)
			// innerRadius = radius of the indent of the teeth.
			// outerRadius = outer radius of the teeth.
			// angle = [optional] starting angle in degrees. Defaults to 0.
			// holeSides = [optional] draw a polygonal hole with this many sides (must be > 2)
			// holeRadius = [optional] size of hole. Default = innerRadius/3.
			// ==============
			
			if(isShadow){
				this.graphics.lineStyle(1,0xDDDDDD,0.0,true);
				this.graphics.beginFill(0x000000,0.2);
			}else{
				this.graphics.lineStyle(1,lineColor,0.55,true);
				this.graphics.beginFill(fillColor,1);
			}
			
			if (sides>2) {
				// init vars
				var step:Number;
				var qtrStep:Number;
				var start:Number;
				var n:Number;
				var dx:Number;
				var dy:Number;
				
				// calculate length of sides
				step = (Math.PI*2)/sides;
				qtrStep = step/4;
				// calculate starting angle in radians
				start = (angle/180)*Math.PI;
				this.graphics.moveTo(x+(Math.cos(start)*outerRadius), y-(Math.sin(start)*outerRadius));
				// draw lines
				for (n=1; n<=sides; n++) {
					dx = x+Math.cos(start+(step*n)-(qtrStep*3))*innerRadius;
					dy = y-Math.sin(start+(step*n)-(qtrStep*3))*innerRadius;
					this.graphics.lineTo(dx, dy);
					dx = x+Math.cos(start+(step*n)-(qtrStep*2))*innerRadius;
					dy = y-Math.sin(start+(step*n)-(qtrStep*2))*innerRadius;
					this.graphics.lineTo(dx, dy);
					dx = x+Math.cos(start+(step*n)-qtrStep)*outerRadius;
					dy = y-Math.sin(start+(step*n)-qtrStep)*outerRadius;
					this.graphics.lineTo(dx, dy);
					dx = x+Math.cos(start+(step*n))*outerRadius;
					dy = y-Math.sin(start+(step*n))*outerRadius;
					this.graphics.lineTo(dx, dy);
				}
				
			}
		}

	}
}