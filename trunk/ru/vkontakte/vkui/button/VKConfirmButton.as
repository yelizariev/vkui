package ru.vkontakte.vkui.button {
	import flash.display.SimpleButton;
	
	/**
	 * @author ivann
	 */
	public class VKConfirmButton extends SimpleButton{
		private var _upState: ConfirmButtonStateUp;
		private var _overState: ConfirmButtonStateOver;

		public function VKConfirmButton(label: String): void{
			_upState = new ConfirmButtonStateUp(label);
			_overState = new ConfirmButtonStateOver(label);
			upState = _upState;
			downState = hitTestState = overState = _overState;
		}
		public function set label(value: String): void {
			_upState.label = value;
			_overState.label = value;
		}
	}
}

