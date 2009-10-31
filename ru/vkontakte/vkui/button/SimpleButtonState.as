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
	internal class SimpleButtonState extends Sprite{
		private var _tField: VKTextFieldMinWidth;
		private var _graphics: Graphics;

		public function SimpleButtonState(label: String, fontColor: Object) {
			var tFormat: TextFormat = new VKTextFormat();
			tFormat.color = fontColor;
			_tField = new VKTextFieldMinWidth(
				tFormat,
				2, //borderTop
				0, //borderLeft
				3, //paddingTop
				3, //paddingBottom
				8, //paddingLeft
				8  //paddingRight
			)
			var sh: Shape = new Shape();
			_graphics = sh.graphics;
			addChild(sh);
			_tField.text = label;
			addChild(_tField);
			draw();
		}
		public function set label(value: String): void{
			_tField.text = value;
			_graphics.clear();
			draw();
		}

		private function draw(): void {
			var contentWidth: Number = _tField.contentWidth
			var contentHeight: Number = _tField.contentHeight;
			var curY: Number=0.0;

			nc1(curY, contentWidth);
			curY+=1.0;

			nc2(curY, contentWidth);
			curY+=1.0;

			ncc(curY, contentWidth, contentHeight);
			curY+=contentHeight;

			nc2(curY, contentWidth);
			curY+=1.0;

			nc1(curY, contentWidth);
			curY+=1.0;

			bottomBorder(curY, contentWidth);
		}
		private function line(curY: Number, width: Number, deltaX: Number, color: uint): void{
			_graphics.beginFill(color);
			_graphics.lineStyle(1.0, color);
			_graphics.moveTo(deltaX, curY);
			_graphics.lineTo(width-deltaX, curY);
			_graphics.endFill();
		}
		private function bottomBorder(curY: Number, width: Number): void{
			line(curY, width, 0.0, ButtonColor.SB_BOTTOM_BORDER);
		}
		private function ncc(curY: Number, width: Number, height: Number): void{
			_graphics.beginFill(ButtonColor.SB_BG);
			_graphics.lineStyle();
			_graphics.moveTo(0.0, curY);
			_graphics.lineTo(width, curY);
			_graphics.lineTo(width, curY + height);
			_graphics.lineTo(0.0, curY + height);
			_graphics.lineTo(0.0, curY);
			_graphics.endFill();
		}
		private function nc1(curY: Number, width: Number): void{
			line(curY, width, 1.0, ButtonColor.SB_CORNER);
			line(curY, width, 2.0, ButtonColor.SB_BG);
		}
		private function nc2(curY: Number, width: Number): void{
			line(curY, width, 0.0, ButtonColor.SB_CORNER);
			line(curY, width, 1.0, ButtonColor.SB_BG);
		}
	}
}
