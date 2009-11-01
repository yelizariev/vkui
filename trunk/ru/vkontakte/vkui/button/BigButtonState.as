package ru.vkontakte.vkui.button {
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import ru.vkontakte.vkui.text.VKTextFieldFixedWidth;
	import ru.vkontakte.vkui.text.VKTextFormat;
	import ru.vkontakte.vkui.text.VKTextColor;
	
	/**
	 * @author ivann
	 */
	internal class BigButtonState extends ModernButtonStateShadow{
		private var _tField: VKTextFieldFixedWidth;
		private var _curContentHeight: Number;

		public function BigButtonState(label: String, width: Number, bgColor: uint) {
			super(bgColor);
			var tFormat: TextFormat = new VKTextFormat();
			tFormat.color = VKTextColor.WHITE;
			tFormat.align = TextFormatAlign.CENTER;
			_tField = new VKTextFieldFixedWidth(
				tFormat,
				width, 
				2.0, //borderTop
				3.0, //borderBottom
				2.0, //borderLeft
				2.0, //borderRight
				5.0, //paddingTop
				5.0, //paddingBottom
				5.0, //paddingLeft
				5.0  //paddingRight
			)
			var sh: Shape = new Shape();
			_graphics = sh.graphics;
			addChild(sh);
			_curContentHeight = _tField.contentHeight;
			_tField.text = label;
			addChild(_tField);
			draw(_tField.contentWidth, _tField.contentHeight);
		}
		public function set label(value: String): void{
			_tField.text = value;
			checkForRedraw();
		}
		private function checkForRedraw(): void{
			if (_curContentHeight != _tField.contentHeight){
				_graphics.clear();
				_curContentHeight = _tField.contentHeight;
				draw(_tField.contentWidth, _tField.contentHeight);
			}
		}
	}
}
