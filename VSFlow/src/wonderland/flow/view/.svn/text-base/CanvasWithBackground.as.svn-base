package wonderland.flow.view
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import mx.containers.Canvas;
	import mx.controls.Image;
	
	public class CanvasWithBackground extends Canvas
	{
		public function CanvasWithBackground()
		{
			super();
			
		}
		
		//[Embed(source="../../assets/bg.png")]
		[Bindable] public var backgroundTileImage:Class;
		

		override protected function updateDisplayList( unscaledWidth : Number, unscaledHeight : Number ) : void  
		{  
			super.updateDisplayList(unscaledWidth, unscaledHeight );  
			
			if ( backgroundTileImage != null )  
			{  
				var bitmap : Bitmap = new backgroundTileImage();  
				var bitmapData : BitmapData = new BitmapData( bitmap.width, bitmap.height );  
				bitmapData.draw( bitmap );        
				
				graphics.clear();  
				graphics.beginBitmapFill( bitmapData );  
				graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);  
				graphics.endFill();  
			}  
		} 
		
	}
}