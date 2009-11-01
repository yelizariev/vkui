package ru.vkontakte.vkui.button {
	import flash.display.SimpleButton;
	
	/**
	 * @author ivann
	 */
	public class VKBigButton extends SimpleButton{
		private var _upState: BigButtonStateUp;
		private var _overState: BigButtonStateOver;

		public function VKBigButton(label: String, width: Number = 134): void{
			_upState = new BigButtonStateUp(label, width);
			_overState = new BigButtonStateOver(label, width);
			upState = _upState;
			downState = hitTestState = overState = _overState;
		}
		public function set label(value: String): void {
			_upState.label = value;
			_overState.label = value;
		}
	}
}

