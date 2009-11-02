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
	internal class PageNumButtonState extends Sprite{
		private var _tField: VKTextFieldMinWidth;
		private var _graphics: Graphics;
		private var _alpha: Number;
		private var _curContentWidth: Number;

		public function PageNumButtonState(label: String, isTop: Boolean, isOver: Boolean) {
			var tFormat: TextFormat = new VKTextFormat();
			var paddingBottom: Number = (isTop) ? 3.0 : 2.0;
			if (isOver){
				_alpha = 1.0;
				tFormat.color = VKTextColor.WHITE;
			}else{
				_alpha = 0.0;
				tFormat.color = VKTextColor.BLUE;
			}
			_tField = new VKTextFieldMinWidth(
				tFormat,
				0, //borderTop
				0, //borderLeft
				3, //paddingTop
				paddingBottom, //paddingBottom
				3, //paddingLeft
				3  //paddingRight
			)
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
		public override function get width(): Number{
			return _tField.contentWidth;
		}
		private function checkForRedraw(): void{
			if (_curContentWidth != _tField.contentWidth){
				_graphics.clear();
				draw();
			}
		}

		private function draw(): void {
			_curContentWidth = _tField.contentWidth;
			var w: Number = _tField.contentWidth;
			var h: Number = _tField.contentHeight;
			_graphics.beginFill(ButtonColor.PAGE_NUM_BG, _alpha);
			_graphics.lineStyle(1.0, ButtonColor.PAGE_NUM_BG, _alpha, true);
			_graphics.moveTo(0.0, 0.0);
			_graphics.lineTo(w-1.0, 0.0);
			_graphics.lineTo(w-1.0, 0.0 + h-1.0);
			_graphics.lineTo(0.0, 0.0 + h-1.0);
			_graphics.lineTo(0.0, 0.0);
			_graphics.endFill();
		}
	}
}
