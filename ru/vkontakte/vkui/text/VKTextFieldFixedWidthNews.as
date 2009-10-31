package ru.vkontakte.vkui.text{
	import flash.text.TextFormat;

	/**
	 * @author ivann
	 */
	public class VKTextFieldFixedWidthNews extends VKTextFieldFixedWidth{
		private var _boldTextFormat: TextFormat;

		public function VKTextFieldFixedWidthNews(
				tFormat: TextFormat,
				autoSize: String,

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
			super(
				tFormat,
				autoSize,

				width,

				borderTop, 
				borderBottom,
				borderLeft,
				borderRight,

				paddingTop, 
				paddingBottom, 
				paddingLeft,
				paddingRight
			);
			_boldTextFormat = tFormat;
			_boldTextFormat.bold = true;
		}
		public function setTextNews(label: String, countNews: int): void{
			var len1: uint = label.length + 2;
			var len2: uint = len1 + String(countNews).length;
			rawSetText(label + ' (' + countNews + ')');
			setTextFormat(_boldTextFormat, len1, len2);
			updateContentHeight();
		}
	}
}
