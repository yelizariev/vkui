package ru.vkontakte.vkui.button {
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.text.TextFormat;
	import ru.vkontakte.vkui.text.VKTextFieldMinWidth;
	import ru.vkontakte.vkui.text.VKTextFormat;
	
	/**
	 * @author ivann
	 */
	internal class TabState extends Sprite{
		private var _tField: VKTextFieldMinWidth;
		private var _graphics: Graphics;
		private var _alpha: Number;
		private var _bgColor: uint;

		public function TabState(label: String, fontColor: Object, bgColor: uint, isTransparency: Boolean = false) {
			_bgColor = bgColor;
			_alpha = (isTransparency)? 0.0 : 1.0;
			var tFormat: TextFormat = new VKTextFormat();
			tFormat.color = fontColor;
			_tField = new VKTextFieldMinWidth(
				tFormat,
				2, //borderTop
				0, //borderLeft
				3, //paddingTop
				5, //paddingBottom
				10, //paddingLeft
				10  //paddingRight
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
			_graphics.clear();
			draw(_tField.contentWidth, _tField.contentHeight);
		}

		protected function draw(contentWidth: Number, contentHeight: Number): void {
			line(0, contentWidth, 2, _bgColor);
			line(1, contentWidth, 1, _bgColor);
			square(2, contentWidth, contentHeight);
		}
		protected function line(curY: Number, width: Number, deltaX: Number, color: uint): void{
			_graphics.beginFill(color, _alpha);
			_graphics.lineStyle(1.0, color, _alpha);
			_graphics.moveTo(deltaX, curY);
			_graphics.lineTo(width-deltaX, curY);
			_graphics.endFill();
		}
		private function square(curY: Number, width: Number, height: Number): void{
			_graphics.beginFill(_bgColor, _alpha);
			_graphics.lineStyle();
			_graphics.moveTo(0, curY);
			_graphics.lineTo(width, curY);
			_graphics.lineTo(width, curY + height);
			_graphics.lineTo(0, curY + height);
			_graphics.lineTo(0, curY);
			_graphics.endFill();
		}
	}
}
