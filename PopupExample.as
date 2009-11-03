package {
	import flash.display.Sprite;
	import flash.display.*;
	import flash.events.*;
	import ru.vkontakte.vkui.button.*;
	import ru.vkontakte.vkui.popup.*;

	public class PopupExample extends Sprite {
		public function PopupExample() {
			drawRect(stage.stageWidth, stage.stageHeight);

			var popup: Popup = new Popup(
				'Настройки приложения',
				new Sprite(),
				[],
				100,
				100,
				100,
				150
			);
			popup.x = 30;
			popup.y = 30;
			addChild(popup);
			popup.show(stage.stageWidth, stage.stageHeight)

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
    
