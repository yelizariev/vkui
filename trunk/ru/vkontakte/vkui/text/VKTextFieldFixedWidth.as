package ru.vkontakte.vkui.text{
	import flash.text.TextFormat;

	/**
	 * @author ivann
	 */
	public class VKTextFieldFixedWidth extends FixTextField{
		private var _addHeight: Number;

		public function VKTextFieldFixedWidth(
				tFormat: TextFormat,

				width: Number,

				borderTop: Number, 
				borderBottom: Number,
				borderLeft: Number,
				borderRight: Number,

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

			_contentWidth = width - borderLeft - borderRight;
			this.width = _contentWidth - paddingLeft - paddingRight
			_contentWidth = Math.round(_contentWidth);

			defaultTextFormat = tFormat;
			autoSize = 'center';
			wordWrap = true;
			super.text = '.'; //test text
			_addHeight = paddingTop + paddingBottom;
			setXY(paddingLeft, borderLeft, paddingTop, borderTop);
		}
		public override function set text(value: String): void{
			super.text = value;
			updateContentHeight();
		}
		protected function rawSetText(value: String): void{
			super.text = value;
		}

		protected function updateContentHeight(): void{
			_contentHeight = Math.round(_addHeight + height);
		}
	}
}
