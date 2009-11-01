package ru.vkontakte.vkui.button {
	import ru.vkontakte.vkui.text.VKTextColor;

	/**
	 * @author ivann
	 */
	final internal class SideFilterButtonStateFull extends SideFilterButtonState{
		public function SideFilterButtonStateFull(label: String, width: Number){
			super(label, width, ButtonColor.MB_BG_UP, ButtonColor.MB_OUT_BORDER, 1.0, VKTextColor.WHITE);
		}
	}
}
