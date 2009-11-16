package {
	import flash.display.Sprite;
	import flash.display.*;
	import flash.events.*;
	import ru.vkontakte.vkui.button.*;
	import ru.vkontakte.vkui.bar.*;
	import ru.vkontakte.vkui.pagination.VKPaginationEvent;

	public class FieldExample extends Sprite {
		public function FieldExample() {
			drawRect(stage.stageWidth, stage.stageHeight);

			var user: VKUserField = new (400 /*width*/, 70/*tableLabelWidth*/, 130/*buttonsWidth*/);
			user.table.addRow();
			user.x = 10;
			user.y = 10;
			addChild(user);
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
    
