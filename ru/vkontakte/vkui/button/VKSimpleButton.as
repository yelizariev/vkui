package ru.vkontakte.vkui.button {
	import ru.vkontakte.vkui.text.VKTextColor;
	import ru.vkontakte.vkui.text.VKTextFormat;

	/**
	 * @author ivann
	 */
	public class VKSimpleButton extends VKButton{
		public function VKSimpleButton(label: String): void{
			var f: VKTextFormat;
			var buttonType: ButtonType = new ButtonType();
			buttonType.minWidth();
			var stDrawer: IVKStateDrawer = new VKSimpleButtonStateDrawer();

			f = new VKTextFormat();
			f.color = VKTextColor.WHITE;
			var upButtonState: ButtonState = new ButtonState(
				buttonType,
				new VKSimpleButtonStateDrawer(), f,
				3, // paddingTop
				3, // paddingBottom
				8, // paddingLeft
				8 // paddingRight
			);

			f = new VKTextFormat();
			f.color = VKTextColor.LIGHT_BLUE;
			var overButtonState: ButtonState = new ButtonState(
				buttonType,
				new VKSimpleButtonStateDrawer(), f,
				3, // paddingTop
				3, // paddingBottom
				8, // paddingLeft
				8 // paddingRight
			);

			super(label, upButtonState, overButtonState);
		}
	}
}

