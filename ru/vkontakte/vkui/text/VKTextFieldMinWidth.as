package ru.vkontakte.vkui.text{
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;

	/**
	 * @author ivann
	 */
	final public class VKTextFieldMinWidth extends FixTextField{
		private var _addWidth: Number;

		public function VKTextFieldMinWidth(
				tFormat: TextFormat,

				borderTop: Number, 
				borderLeft: Number,

				paddingTop: Number, 
				paddingBottom: Number, 
				paddingLeft: Number,
				paddingRight: Number
			) {
			super();
			paddingTop = fixPadding(paddingTop);
			paddingBottom = fixPadding(paddingBottom);
			paddingLeft = fixPadding(paddingLeft);
			paddingRight = fixPadding(paddingRight);
			_addWidth = paddingLeft + paddingRight;

			defaultTextFormat = tFormat;
			autoSize = TextFieldAutoSize.LEFT;
			wordWrap = false;
			super.text = '.'; //test text
			_contentHeight = Math.round(paddingTop + paddingBottom + height);
			setXY(paddingLeft, borderLeft, paddingTop, borderTop);
		}
		public override function set text(value: String): void{
			super.text = value;
			_contentWidth = Math.round(_addWidth + width);
		}
	}
}
