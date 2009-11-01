package ru.vkontakte.vkui.button {
	import flash.display.SimpleButton;
	
	/**
	 * @author ivann
	 */
	public class VKSimpleButton extends SimpleButton{
		private var _upState: SimpleButtonStateUp;
		private var _overState: SimpleButtonStateOver;

		public function VKSimpleButton(label: String): void{
			_upState = new SimpleButtonStateUp(label);
			_overState = new SimpleButtonStateOver(label);
			upState = _upState;
			downState = hitTestState = overState = _overState;
		}
		public function set label(value: String): void {
			_upState.label = value;
			_overState.label = value;
		}
	}
}

