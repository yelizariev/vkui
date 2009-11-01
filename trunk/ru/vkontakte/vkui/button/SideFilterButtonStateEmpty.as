package ru.vkontakte.vkui.button {
	import ru.vkontakte.vkui.text.VKTextColor;

	/**
	 * @author ivann
	 */
	final internal class SideFilterButtonStateEmpty extends SideFilterButtonState{
		public function SideFilterButtonStateEmpty(label: String, width: Number){
			super(label, width, 0, 0, 0.0, VKTextColor.BLUE);
		}
	}
}
