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
	internal class CancelButtonState extends Sprite{
		private var _graphics: Graphics;
		private var _bgColor: uint
		private var _tField: VKTextFieldMinWidth;

		public function CancelButtonState(label: String, bgColor: uint) {
			_bgColor = bgColor;
			var tFormat: TextFormat = new VKTextFormat();
			tFormat.color = VKTextColor.BLACK;
			_tField = new VKTextFieldMinWidth(
				tFormat,
				2.0, //borderTop
				2.0, //borderLeft
				4.0, //paddingTop
				4.0, //paddingBottom
				14.0, //paddingLeft
				14.0  //paddingRight
			)
			var sh: Shape = new Shape();
			_graphics = sh.graphics;
			addChild(sh);
			_tField.text = label;
			addChild(_tField);
			draw(_tField.contentWidth, _tField.contentHeight);
		}
		public function set label(value: String): void{
			_tField.text = value;
		}

		protected function draw(w: Number, h: Number): void {
			//w = contentWidth
			//h = contentHeight
			_graphics.lineStyle(1.0, ButtonColor.CB_OUT_TOP_BORDER);
			_graphics.moveTo(0.0,   0.0);
			_graphics.lineTo(w+3.0, 0.0);
			_graphics.lineStyle(1.0, ButtonColor.CB_OUT_BORDER);
			_graphics.lineTo(w+3.0, h+3.0);
			_graphics.lineTo(0.0,   h+3.0);
			_graphics.lineTo(0.0,   0.0);

			_graphics.lineStyle(1.0, ButtonColor.CB_INNER_TOP_BORDER);
			_graphics.moveTo(1.0,   1.0);
			_graphics.lineTo(w+2.0, 1.0);
			_graphics.lineStyle(1.0, ButtonColor.CB_INNER_SIDE_BORDER);
			_graphics.lineTo(w+2.0, h+2.0);
			_graphics.lineStyle(1.0, ButtonColor.CB_INNER_BOTTOM_BORDER);
			_graphics.lineTo(1.0,   h+2.0);
			_graphics.lineStyle(1.0, ButtonColor.CB_INNER_SIDE_BORDER);
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
