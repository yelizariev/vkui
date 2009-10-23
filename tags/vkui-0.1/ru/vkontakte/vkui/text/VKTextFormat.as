package ru.vkontakte.vkui.text{
	import flash.text.TextFormat;

	/**
	 * @author ivann
	 */
	public class VKTextFormat extends TextFormat{
		public function VKTextFormat(): void{
			super();
			font = "Tahoma";
			//font = "Verdana";
			size = 11;
		}
	}
}
