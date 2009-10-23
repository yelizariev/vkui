package ru.vkontakte.vkui.button {
	import flash.display.Sprite;
	/**
	 * @author ivann
	 */
	internal interface  IVKStateDrawer{
		function draw(contentWidth: Number, contentHeight: Number): Sprite;
		function get leftBorder(): Number;
		function get topBorder(): Number;
	}
}
