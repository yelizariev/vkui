package ru.vkontakte.vkui.button {
	import ru.vkontakte.vkui.text.VKTextColor;
	
	/**
	 * @author ivann
	 */
	internal class TabStateEmpty extends TabState{
		public function TabStateEmpty(label: String): void{
			super(label, VKTextColor.BLUE, ButtonColor.OVER, true);
		}
	}
}
