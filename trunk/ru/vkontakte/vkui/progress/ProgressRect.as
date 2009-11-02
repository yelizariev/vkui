package ru.vkontakte.vkui.progress {
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;

	/**
	 * @author ivann
	 */
	internal class ProgressRect{
		private var _low: Shape;
		private var _middle: Shape;
		private var _high: Shape;

		public function ProgressRect(container: DisplayObjectContainer, x: Number, width: Number, height: Number): void{
			_low = drawRect(width, height, ProgressColor.RECT_LOW);
			_middle = drawRect(width, height, ProgressColor.RECT_MIDDLE);
			_high = drawRect(width, height, ProgressColor.RECT_HIGH);
			_low.y = _middle.y = _high.y = 0;
			_low.x = _middle.x = _high.x = x;
			container.addChild(_low);
			container.addChild(_middle);
			container.addChild(_high);
			hide();
		}
		public function high(): void{
			hide();
			_high.visible = true;
		}
		public function middle(): void{
			hide();
			_middle.visible = true;
		}
		public function low(): void{
			hide();
			_low.visible = true;
		}
		public function hide(): void{
			_low.visible = _middle.visible = _high.visible = false;
		}
		private function drawRect(width: Number, height: Number, color: uint): Shape{
			var sh: Shape = new Shape();
			sh.graphics.beginFill(color);
			sh.graphics.lineStyle(1.0, color, 1.0, true);
			sh.graphics.moveTo(0.0, 0.0);
			sh.graphics.lineTo(width-1.0, 0.0);
			sh.graphics.lineTo(width-1.0, height-1.0);
			sh.graphics.lineTo(0.0, height-1.0);
			sh.graphics.lineTo(0.0, 0.0);
			sh.graphics.endFill();
			return sh;
		}
	}
}

