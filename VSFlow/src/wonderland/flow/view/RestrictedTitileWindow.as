package wonderland.flow.view
{
	import flash.geom.Rectangle;
	
	import spark.components.TitleWindow;
	import spark.events.TitleWindowBoundsEvent;
	
	public class RestrictedTitileWindow extends TitleWindow
	{
		public function RestrictedTitileWindow()
		{
			super();
			this.addEventListener(TitleWindowBoundsEvent.WINDOW_MOVE_END,windowMovementHandler);
		}
		
		private function windowMovementHandler(e:TitleWindowBoundsEvent):void{
			var windowX:Number = e.afterBounds.x;
			var windowY:Number = e.afterBounds.y;
			var dH:Number = moveArea.height;
			if (windowY + dH < 6)
			{
				this.x = e.beforeBounds.x;
				this.y = e.beforeBounds.y;
			}
			else if (windowX * -1 > e.afterBounds.width - 6)
			{
				this.x = e.beforeBounds.x;
				this.y = e.beforeBounds.y;
			}
			else if (windowY > (stage.stageHeight - 6))
			{
				this.x = e.beforeBounds.x;
				this.y = e.beforeBounds.y;
			}
			else if (windowX > (stage.stageWidth - 6))
			{
				this.x = e.beforeBounds.x;
				this.y = e.beforeBounds.y;
			}
		}
	}
}