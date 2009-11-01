package ru.vkontakte.vkui.button {
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Graphics;
	
	/**
	 * @author ivann
	 */
	internal class BorderRectDrawer extends Sprite{
		private var _bgColor: uint;
		private var _borderColor: uint;
		private var _alpha: Number;
		protected var _graphics: Graphics;

		public function BorderRectDrawer(bgColor: uint, borderColor: uint, alpha: Number) {
			_bgColor = bgColor;
			_borderColor = borderColor;
			_alpha = alpha;
			var sh: Shape = new Shape();
			addChild(sh);
			_graphics = sh.graphics;
		}

		protected function draw(w: Number, h: Number): void {
			// w,h — contentWidth, contentHeight);

			_graphics.beginFill(_bgColor, _alpha);
			_graphics.lineStyle(1.0, _borderColor, _alpha);
			_graphics.moveTo(0.0,   0.0);
			_graphics.lineTo(0.0,   h+1.0);
			_graphics.lineTo(w+1.0, h+1.0);
			_graphics.lineTo(w+1.0, 0.0);
			_graphics.lineTo(0.0,   0.0);
			_graphics.endFill();
		}
	}
}
