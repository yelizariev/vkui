package ru.vkontakte.vkui.button {
	import ru.vkontakte.vkui.text.VKTextColor;
	
	/**
	 * @author ivann
	 */
	final internal class SimpleButtonStateOver extends SimpleButtonState{
		public function SimpleButtonStateOver(label: String){
			super(label, VKTextColor.LIGHT_BLUE);
		}
	}
}
