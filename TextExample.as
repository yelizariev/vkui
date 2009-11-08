package {
	import flash.display.Sprite;
	import flash.display.*;
	import flash.events.*;
	import ru.vkontakte.vkui.button.*;
	import ru.vkontakte.vkui.text.*;

	public class TextExample extends Sprite {
		public function TextExample() {
			drawRect(stage.stageWidth, stage.stageHeight);
			var profileTable: VKProfileTable = new VKProfileTable();
			profileTable.addRow('Пол:', 'мужской');
			profileTable.addRow('День рождения:', '10 октября 1984 г.');
			profileTable.addRow('Родной город:', 'Torino, Ленинград');
			profileTable.addRow('Полит. взгляды:', 'умеренные');
			profileTable.addRow('Религ. взгляды:', 'Zen Buddhism');
			profileTable.x = 50;
			profileTable.y = 10;
			addChild(profileTable);
			trace('w='+profileTable.width);
			trace('h='+profileTable.height);
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
    
