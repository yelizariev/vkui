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
	internal class ModernButtonState extends Sprite{
		protected var _graphics: Graphics;
		private var _bgColor: uint

		public function ModernButtonState(bgColor: uint) {
			_bgColor = bgColor;
		}

		protected function draw(w: Number, h: Number): void {
			//w = contentWidth
			//h = contentHeight
			_graphics.lineStyle(1.0, ButtonColor.MB_OUT_BORDER);
			_graphics.moveTo(0.0,   0.0);
			_graphics.lineTo(0.0,   h+3.0);
			_graphics.lineTo(w+3.0, h+3.0);
			_graphics.lineTo(w+3.0, 0.0);
			_graphics.lineTo(0.0,   0.0);

			_graphics.lineStyle(1.0, ButtonColor.MB_INNER_TOP_BORDER);
			_graphics.moveTo(1.0,   1.0);
			_graphics.lineTo(w+2.0, 1.0);
			_graphics.lineStyle(1.0, ButtonColor.MB_INNER_BORDER);
			_graphics.lineTo(w+2.0, h+2.0);
			_graphics.lineTo(1.0,   h+2.0);
			_graphics.lineTo(1.0,   1.0);

			_graphics.beginFill(_bgColor);
			_graphics.lineStyle(1.0, _bgColor);
			_graphics.moveTo(2.0,   2.0);
			_graphics.lineTo(2.0,   h+1.0);
			_graphics.lineTo(w+1.0, h+1.0);
			_graphics.lineTo(w+1.0, 2.0);
			_graphics.lineTo(2.0,   2.0);
			_graphics.endFill();
		}
	}
}
