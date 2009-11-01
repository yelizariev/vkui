package ru.vkontakte.vkui.button {
	import ru.vkontakte.vkui.text.VKTextColor;

	/**
	 * @author ivann
	 */
	final internal class SideFilterButtonStateOver extends SideFilterButtonState{
		public function SideFilterButtonStateOver(label: String, width: Number){
			super(label, width, ButtonColor.OVER, ButtonColor.OVER, 1.0, VKTextColor.BLUE);
		}
	}
}
