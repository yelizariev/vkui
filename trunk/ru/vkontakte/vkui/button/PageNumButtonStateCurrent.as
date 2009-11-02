package ru.vkontakte.vkui.button {
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.text.TextFormat;
	import ru.vkontakte.vkui.text.VKTextFieldMinWidth;
	import ru.vkontakte.vkui.text.VKTextFormat;
	import ru.vkontakte.vkui.text.VKTextColor;
	
	/**
	 * @author ivann
	 */
	internal class PageNumButtonStateCurrent extends Sprite{
		private var _tField: VKTextFieldMinWidth;
		private var _graphics: Graphics;
		private var _curContentWidth: Number;
		private var _isTop: Boolean;

		public function PageNumButtonStateCurrent(label: String, isTop: Boolean) {
			_isTop = isTop;
			var tFormat: TextFormat = new VKTextFormat();
			tFormat.color = VKTextColor.BLUE_BOLD;
			tFormat.bold = true;
			if (isTop){
				_tField = new VKTextFieldMinWidth(
					tFormat,
					0, //borderTop
					0, //borderLeft
					3, //paddingTop
					2, //paddingBottom
					2, //paddingLeft
					2  //paddingRight
				)
			}else{
				_tField = new VKTextFieldMinWidth(
					tFormat,
					2, //borderTop
					0, //borderLeft
					1, //paddingTop
					4, //paddingBottom
					2, //paddingLeft
					2  //paddingRight
				)
			}
			var sh: Shape = new Shape();
			sh.x = 0;
			sh.y = 0;
			_graphics = sh.graphics;
			addChild(sh);
			_tField.text = label;
			addChild(_tField);
			draw();
		}
		public function set label (value: String): void{
			_tField.text = value;
			checkForRedraw();
		}
		private function checkForRedraw(): void{
			if (_curContentWidth != _tField.contentWidth){
				_graphics.clear();
				draw();
			}
		}
		public override function get width(): Number{
			return _tField.contentWidth;
		}

		private function draw(): void {
			_curContentWidth = _tField.contentWidth;
			var w: Number = _tField.contentWidth;
			var curY: Number;
			if (_isTop)
				curY = _tField.contentHeight+1;
			else
				curY = 1.0;
			_graphics.lineStyle(2.0, ButtonColor.PAGE_NUM_BG, 1.0, true, "normal", "none");
			_graphics.moveTo(0.0, curY);
			_graphics.lineTo(w, curY);
		}
	}
}
