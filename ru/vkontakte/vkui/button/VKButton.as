package ru.vkontakte.vkui.button {
	import flash.display.SimpleButton;

	/**
	 * @author ivann
	 */
	internal class VKButton extends SimpleButton {
		private var _upButtonState: ButtonState;
		private var _overButtonState: ButtonState;
		
		public function VKButton(label: String, upButtonState: ButtonState, overButtonState: ButtonState): void {
			_upButtonState = upButtonState;
			_overButtonState = overButtonState;

			useHandCursor  = true;
			this.updateButton(label);
		}
		
		public function set label(value: String): void {
			updateButton(value);
		}
		
		private function updateButton(label: String): void {
			upState = _upButtonState.make(label);
			overState = _overButtonState.make(label);
			downState = hitTestState = overState;
		}
	}
}
