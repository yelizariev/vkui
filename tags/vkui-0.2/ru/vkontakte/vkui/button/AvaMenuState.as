package ru.vkontakte.vkui.button {
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.text.TextFormat;
	import ru.vkontakte.vkui.text.VKTextFieldFixedWidth;
	import ru.vkontakte.vkui.text.VKTextFormat;
	import ru.vkontakte.vkui.text.VKTextColor;
	
	/**
	 * @author ivann
	 */
	internal class AvaMenuState extends Sprite{
		private var _tField: VKTextFieldFixedWidth;
		private var _graphics: Graphics;
		private var _alpha: Number;
		private var _curContentHeight: Number;

		public function AvaMenuState(label: String, width: Number, isTransparent: Boolean) {
			_alpha = (isTransparent)? 0.0 : 1.0;
			var tFormat: TextFormat = new VKTextFormat();
			tFormat.color = VKTextColor.BLUE;
			_tField = new VKTextFieldFixedWidth(
				tFormat,
				width, 
				0, //borderTop
				1, //borderBottom
				0, //borderLeft
				0, //borderRight
				3, //paddingTop
				3, //paddingBottom
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
			//trace('label='+label);
			//trace('y='+_tField.y);
			//trace('contentHeight='+_tField.contentHeight);
			//trace('height='+_tField.height);
			//trace('textHeight='+_tField.textHeight);
		}
		public function set label (value: String): void{
			_tField.text = value;
			checkForRedraw();
		}
		private function checkForRedraw(): void{
			if (_curContentHeight != _tField.contentHeight){
				_graphics.clear();
				draw();
			}
		}

		private function draw(): void {
			_curContentHeight = _tField.contentHeight;
			var w: Number = _tField.contentWidth;
			var h: Number = _tField.contentHeight;
			_graphics.beginFill(ButtonColor.AVA_MENU_BOTTOM_BORDER);
			_graphics.moveTo(0, h);
			_graphics.lineStyle(1, ButtonColor.AVA_MENU_BOTTOM_BORDER);
			_graphics.lineTo(w, h);
			_graphics.endFill();

			_graphics.beginFill(ButtonColor.OVER, _alpha);
			//_graphics.lineStyle();
			_graphics.lineStyle(1.0, ButtonColor.OVER, _alpha);
			_graphics.moveTo(0.0, 0.0);
			_graphics.lineTo(w-1, 0.0);
			_graphics.lineTo(w-1, 0.0 + h-1);
			_graphics.lineTo(0.0, 0.0 + h-1);
			_graphics.lineTo(0.0, 0.0);
			_graphics.endFill();
		}
	}
}
