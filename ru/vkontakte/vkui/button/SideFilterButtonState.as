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
	internal class SideFilterButtonState extends BorderRectDrawer{
		private var _tField: VKTextFieldFixedWidth;
		private var _curContentHeight: Number;

		public function SideFilterButtonState(label: String, width: Number, bgColor: uint, borderColor: uint, alpha: Number, textColor: Object) {
			super(bgColor, borderColor, alpha);
			var tFormat: TextFormat = new VKTextFormat();
			tFormat.color = textColor;
			tFormat.align = TextFormatAlign.LEFT;
			_tField = new VKTextFieldFixedWidth(
				tFormat,
				width, 
				1.0, //borderTop
				1.0, //borderBottom
				1.0, //borderLeft
				1.0, //borderRight
				4.0, //paddingTop
				4.0, //paddingBottom
				10.0, //paddingLeft
				5.0  //paddingRight
			);
			_tField.text = label;
			_curContentHeight = _tField.contentHeight;
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
