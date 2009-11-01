package ru.vkontakte.vkui.button {
	import ru.vkontakte.vkui.text.VKTextColor;
	
	/**
	 * @author ivann
	 */
	internal class TabStateOver extends TabState{
		public function TabStateOver(label: String): void{
			super(label, VKTextColor.BLUE, ButtonColor.OVER);
		}
	}
}
