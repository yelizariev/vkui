package ru.vkontakte.vkui.button {
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import ru.vkontakte.vkui.text.VKTextFieldMinWidth;
	import ru.vkontakte.vkui.text.VKTextFormat;
	import ru.vkontakte.vkui.text.VKTextColor;
	
	/**
	 * @author ivann
	 */
	internal class ConfirmButtonState extends ModernButtonState{
		private var _tField: VKTextFieldMinWidth;

		public function ConfirmButtonState(label: String, bgColor: uint) {
			super(bgColor);
			var tFormat: TextFormat = new VKTextFormat();
			tFormat.color = VKTextColor.WHITE;
			_tField = new VKTextFieldMinWidth(
				tFormat,
				2.0, //borderTop
				2.0, //borderLeft
				4.0, //paddingTop
				4.0, //paddingBottom
				14.0, //paddingLeft
				14.0  //paddingRight
			)
			var sh: Shape = new Shape();
			_graphics = sh.graphics;
			addChild(sh);
			_tField.text = label;
			addChild(_tField);
			draw(_tField.contentWidth, _tField.contentHeight);
		}
		public function set label(value: String): void{
			_tField.text = value;
			draw(_tField.contentWidth, _tField.contentHeight);
		}
	}
}
