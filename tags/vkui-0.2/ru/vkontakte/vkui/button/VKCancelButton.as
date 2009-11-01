package ru.vkontakte.vkui.button {
	import flash.display.SimpleButton;
	
	/**
	 * @author ivann
	 */
	public class VKCancelButton extends SimpleButton{
		private var _upState: CancelButtonStateUp;
		private var _overState: CancelButtonStateOver;

		public function VKCancelButton(label: String): void{
			_upState = new CancelButtonStateUp(label);
			_overState = new CancelButtonStateOver(label);
			upState = _upState;
			downState = hitTestState = overState = _overState;
		}
		public function set label(value: String): void {
			_upState.label = value;
			_overState.label = value;
		}
	}
}

