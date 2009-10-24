package ru.vkontakte.vkui.button {
	import flash.text.TextFormat;
	import flash.display.Sprite;

	/**
	 * @author ivann
	 */
	public class ButtonStateNews extends ButtonState{
		private var _tFormat: TextFormat;

		public function ButtonStateNews( 
				buttonType: ButtonType, 
				stateDrawer: IVKStateDrawer, textFormat: TextFormat,
				paddingTop: Number, paddingBottom: Number, paddingLeft: Number = 8, paddingRight: Number = 8
			) {
			super(buttonType, stateDrawer, textFormat, paddingTop, paddingBottom, paddingLeft, paddingRight);
			_tFormat = _tField.defaultTextFormat;
		}
		public override function make(label: String): Sprite{
			_tFormat.bold = false;
			_tField.defaultTextFormat = _tFormat;
			return super.make(label);
		}
		public function makeNews(label: String, countNews: uint): Sprite{
			var len1: uint = label.length + 2;
			var len2: uint = len1 + String(countNews).length;
			_tField.text = label + ' (' + countNews + ')';
			_tFormat.bold = false;
			_tField.setTextFormat(_tFormat, 0, len1);
			_tField.setTextFormat(_tFormat, len2, len2 + 1);
			_tFormat.bold = true;
			_tField.setTextFormat(_tFormat, len1, len2);
			return makeState();
		}
	}
}

