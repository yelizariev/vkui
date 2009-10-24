package ru.vkontakte.vkui.button {

	/**
	 * @author ivann
	 */
	internal class ButtonType{
		private var _isFixedWidth: Boolean;
		private var _width: Number = 0;
		private var _isLeftAlign: Boolean; // если false, то align = center

		public function get isLeftAlign(): Boolean{
			return _isLeftAlign;
		}
		public function get isFixedWidth(): Boolean{
			return _isFixedWidth;
		}
		public function get width(): Number{
			return _width;
		}
		public function fixedWidthLeft(width: Number): void{
			_isFixedWidth = true;
			_isLeftAlign = true;
			_width = width;
		}
		public function fixedWidthCenter(width: Number): void{
			_isFixedWidth = true;
			_isLeftAlign = false;
			_width = width;
		}
		public function minWidth(): void{
			_isFixedWidth = false;
		}
	}
}
