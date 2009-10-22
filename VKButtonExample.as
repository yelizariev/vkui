package {
	import flash.display.Sprite;
	import flash.display.*;
	import flash.events.*;
	import ru.vkontakte.vkui.simple.button.VKButton;

	public class VKButtonExample extends Sprite {
		public function VKButtonExample() {
			drawRect(stage.stageWidth, stage.stageHeight);
			trace("stageHeight="+stage.stageHeight);

			var btn: VKButton = new VKButton('Event');
			btn.x = 15;
			btn.y = 15;
			addChild(btn);

			var btn1: VKButton = new VKButton('OK', 2);
			btn1.x = btn.x;
			btn1.y = btn.y + btn.height + 10;
			addChild(btn1);

			var btn2: VKButton = new VKButton('Very long button\'label');
			btn2.x = btn1.x;
			btn2.y = btn1.y + btn1.height + 10;
			addChild(btn2);

			btn.addEventListener(MouseEvent.CLICK, function(e: MouseEvent):void {
				trace("btn clicked");
			});
		}
		private function drawRect(width: Number, height: Number): void {
			graphics.clear();
			graphics.beginFill(0xFFFFFF);
			graphics.lineStyle(1, 0x36638E, 0.8, false, LineScaleMode.NONE, CapsStyle.SQUARE);
			graphics.moveTo(0, 0);
			graphics.lineTo(width - 1, 0);
			graphics.lineTo(width - 1, height - 1);
			graphics.lineTo(0, height);
			graphics.lineTo(0, 0);
			graphics.endFill();
		}
	}
}
    
