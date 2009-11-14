package ru.vkontakte.vkui.button {
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.display.CapsStyle;
	import flash.display.LineScaleMode;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import ru.vkontakte.vkui.text.VKTextFieldFixedWidthNews;
	import ru.vkontakte.vkui.text.VKTextFormat;
	import ru.vkontakte.vkui.text.VKTextColor;
	
	/**
	 * @author ivann
	 */
	internal class MenuState extends Sprite{
		private var _tField: VKTextFieldFixedWidthNews;
		private var _graphics: Graphics;
		private var _alpha: Number;
		private var _curContentHeight: Number;

		public function MenuState(label: String, countNews: uint, width: Number, isTransparency: Boolean) {
			_alpha = (isTransparency)? 0.0 : 1.0;
			var tFormat: TextFormat = new VKTextFormat();
			tFormat.color = VKTextColor.BLUE;
			_tField = new VKTextFieldFixedWidthNews(
				tFormat,
				width, 
				1, //borderTop
				0, //borderBottom
				0, //borderLeft
				0, //borderRight
				3, //paddingTop
				3, //paddingBottom
				6, //paddingLeft
				3  //paddingRight
			)
			var sh: Shape = new Shape();
			sh.x = 0;
			sh.y = 0;
			_graphics = sh.graphics;
			addChild(sh);
			updateText(label, countNews);
			addChild(_tField);
			draw();
		}
		public function update(label: String, countNews: int): void{
			updateText(label, countNews);
			checkForRedraw();
		}
		private function updateText(label: String, countNews: int): void{
			if (countNews == 0)
				_tField.text = label;
			else
				_tField.setTextNews(label, countNews);
		}
		private function checkForRedraw(): void{
			if (_curContentHeight != _tField.contentHeight){
				_curContentHeight = _tField.contentHeight;
				_graphics.clear();
				draw();
			}
		}

		private function draw(): void {
			var w: Number = _tField.contentWidth;
			var h: Number = _tField.contentHeight;
			_graphics.lineStyle(1, ButtonColor.MENU_TOP_BORDER, _alpha, true, LineScaleMode.NONE, CapsStyle.NONE);
			_graphics.moveTo(0, 0);
			_graphics.lineTo(w-1, 0);

			var curY: Number = 1.0;
			_graphics.beginFill(ButtonColor.OVER, _alpha);
			//_graphics.lineStyle();
			_graphics.lineStyle(1.0, ButtonColor.OVER, _alpha);
			_graphics.moveTo(0.0, curY);
			_graphics.lineTo(w-1, curY);
			_graphics.lineTo(w-1, curY + h-1);
			_graphics.lineTo(0.0, curY + h-1);
			_graphics.lineTo(0.0, curY);
			_graphics.endFill();
		}
	}
}
