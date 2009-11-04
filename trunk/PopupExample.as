package {
	import flash.display.Sprite;
	import flash.display.*;
	import flash.events.*;
	import ru.vkontakte.vkui.button.*;
	import ru.vkontakte.vkui.popup.*;

	public class PopupExample extends Sprite {
		private var _vkDialog: VKDialogPopup;
		public function PopupExample() {
			drawRect(stage.stageWidth, stage.stageHeight);
			var btn: VKSimpleButton = new VKSimpleButton('VKDialogPopup');
			btn.x = 5;
			btn.y = 5;
			btn.addEventListener(MouseEvent.CLICK, showDialog);
			addChild(btn);
			var content: Shape = new Shape();
			content.graphics.beginFill(0x4B769F);
			content.graphics.drawCircle(100, 100, 100);
			content.graphics.endFill();
			var onConfirm: Function = function(): void{ trace('confirm')};
			var onCancel: Function = function(): void{ trace('cancel')};
			_vkDialog = new VKDialogPopup(
				'Настройки приложения',
				content,
				onConfirm,
				onCancel,
				'Разрешить'
			);
			_vkDialog.x = 30;
			_vkDialog.y = 30;
			stage.addChild(_vkDialog);

		}
		private function showDialog(e: MouseEvent): void{
			_vkDialog.show(stage.stageWidth, stage.stageHeight);
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
    
