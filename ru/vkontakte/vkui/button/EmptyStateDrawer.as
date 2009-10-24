package ru.vkontakte.vkui.button {
	import flash.display.Sprite;
	import flash.display.Shape;

	/**
	 * @author ivann
	 */
	internal class EmptyStateDrawer implements IVKStateDrawer {
		private var _top: Number;
		private var _bottom: Number;
		private var _left: Number;
		private var _right: Number;

		public function EmptyStateDrawer(top: Number, bottom: Number, left: Number, right: Number): void{
			_top = top;
			_bottom = bottom;
			_left = left;
			_right = right;
		}

		public function get leftBorder(): Number{
			return _left;
		}
		public function get rightBorder(): Number{
			return _right;
		}
		public function get topBorder(): Number{
			return _top;
		}

		public function draw(contentWidth: Number, contentHeight: Number): Sprite {
			contentWidth = Math.round(contentWidth);
			contentHeight = Math.round(contentHeight);
			var st: Sprite = new Sprite();
			var shape: Shape = new Shape();
			shape.graphics.beginFill(ToggleButtonColor.OVER);
			shape.graphics.lineStyle();
			shape.graphics.drawRect(0, 0,
				_left + contentWidth + _right,
				_top + contentHeight + _bottom
			);
			shape.x = 0;
			shape.y = 0;
			st.addChild(shape);
			st.alpha = 0.0;
			return st;
		}
	}
}
