package ru.vkontakte.vkui.text{
	import flash.text.TextField;

	/**
	 * @author ivann
	 */
	internal class FixTextField extends TextField{
		protected var _contentWidth: Number;
		protected var _contentHeight: Number;

		public function FixTextField(): void{
			super();
		}

		public function get contentWidth(): Number{
			return _contentWidth;
		}
		public function get contentHeight(): Number{
			return _contentHeight;
		}

		protected function fixPadding(padding: Number): Number{
			return (padding - 2.0); // 2 = (height -  textHeight)/2
		}

		protected function setXY(paddingLeft: Number, borderLeft: Number, paddingTop: Number, borderTop: Number): void{
			x = paddingLeft + borderLeft;
			y = paddingTop + borderTop;
		}
	}
}
