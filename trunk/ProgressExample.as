package {
	import flash.display.Sprite;
	import flash.display.*;
	import flash.events.*;
	import ru.vkontakte.vkui.button.*;
	import ru.vkontakte.vkui.progress.*;

	public class ProgressExample extends Sprite {
		public function ProgressExample() {
			drawRect(stage.stageWidth, stage.stageHeight);

			var p3: VKProgress3 = new VKProgress3();
			p3.x = 15;
			p3.y = 15;
			addChild(p3);

			var btn: VKSimpleButton = new VKSimpleButton('VKProgress3');
			btn.x = p3.x + p3.width + 10;
			btn.y = p3.y;
			btn.addEventListener(MouseEvent.CLICK, function(e: MouseEvent):void {
				p3.visible = !p3.visible;
			});
			addChild(btn);
		}
		private function drawRect(width: Number, height: Number): void {
			graphics.clear();
			graphics.beginFill(0xF7F7F7);
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
    
