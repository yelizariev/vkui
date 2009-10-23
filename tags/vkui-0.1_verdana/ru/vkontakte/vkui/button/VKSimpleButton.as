package ru.vkontakte.vkui.button {
	import ru.vkontakte.vkui.text.VKTextColor;
	import ru.vkontakte.vkui.text.VKTextFormat;

	/**
	 * @author ivann
	 */
	public class VKSimpleButton extends VKButton{
		public function VKSimpleButton(label: String): void{
			init();
			super(label);
		}
		private function init(): void{
			_pTop = 3;
			_pBottom = _pTop;
			_pLeft = 8;
			_pRight = _pLeft;

			_upTextFormat = new VKTextFormat();
			_upTextFormat.color = VKTextColor.WHITE;
			_overTextFormat = new VKTextFormat();
			_overTextFormat.color = VKTextColor.LIGHT_BLUE;

			_upStateDrawer = new VKSimpleButtonStateDrawer();
		}
	}
}

