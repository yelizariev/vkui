package ru.vkontakte.vkui.button {
	import flash.display.SimpleButton;
	import flash.text.TextFormat;
	import ru.vkontakte.vkui.text.*;

	/**
	 * @author ivann
	 */
	public class VKAvaMenuButton extends SimpleButton {
		protected var _emptyState: AvaMenuStateEmpty;
		protected var _overState: AvaMenuStateOver;

		public function VKAvaMenuButton(label: String, width: Number = 200){
			init(label, width);
		}
		public function set label (value: String): void{
			_emptyState.label = value;
			_overState.label = value;
		}
		private function init(label: String, width: Number): void{
			_emptyState = new AvaMenuStateEmpty(label,  width);
			_overState = new AvaMenuStateOver(label, width)
			upState = _emptyState;
			downState = hitTestState = overState = _overState;
		}
	}
}
