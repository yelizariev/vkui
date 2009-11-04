package ru.vkontakte.vkui.popup{
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import ru.vkontakte.vkui.button.*;

	/**
	 * @author ivann
	 */
	public class VKDialogPopup extends Popup{
		private var _onConfirm: Function;
		private var _onCancel: Function;
		public function VKDialogPopup(
			title: String, 
			content: DisplayObject, 
			onConfirm: Function,
			onCancel: Function,
			confirmLabel: String = 'Сохранить',
			cancelLabel: String = 'Отмена',
			paddingTop: Number = 10.0, 
			paddingBottom: Number = 10.0, 
			paddingLeft: Number = 10.0,
			paddingRight: Number = 10.0
		){
			var confirmButton: VKConfirmButton = new VKConfirmButton(confirmLabel);
			var cancelButton: VKCancelButton = new VKCancelButton(cancelLabel);
			confirmButton.addEventListener(MouseEvent.CLICK, onClickConfirm);
			cancelButton.addEventListener(MouseEvent.CLICK, onClickCancel);
			var buttons: Array = [cancelButton, confirmButton];
			super(title, content, buttons, paddingTop, paddingBottom, paddingLeft, paddingRight);
			_onCancel = onCancel;
			_onConfirm = onConfirm;
		}
		private function onClickConfirm(e: MouseEvent): void{
			hide();
			_onConfirm();
		}
		private function onClickCancel(e: MouseEvent): void{
			hide();
			_onCancel();
		}

	}
}
