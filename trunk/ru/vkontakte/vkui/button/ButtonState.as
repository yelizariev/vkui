package ru.vkontakte.vkui.button {
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 * @author ivann
	 */
	internal class ButtonState {
		private var _stDrawer: IVKStateDrawer;
		private var _isFixedWidth: Boolean;
		protected var _tField: TextField;
		private var _width: Number; //внутренние использование. См. код
		private var _height: Number;

		public function ButtonState( 
				buttonType: ButtonType, 
				stateDrawer: IVKStateDrawer, textFormat: TextFormat,
				paddingTop: Number, paddingBottom: Number, paddingLeft: Number = 8, paddingRight: Number = 8
			) {
			_stDrawer = stateDrawer;
			_isFixedWidth = buttonType.isFixedWidth;

			//_pTop = paddingTop;
			//_pBottom = paddingBottom;
			//_pLeft = paddingLeft;
			//_pRight = paddingRight;

			_tField = new TextField();
			_tField.defaultTextFormat = textFormat;
			_tField.autoSize = TextFieldAutoSize.LEFT;
			_tField.text = '.';//test text
			var fixTextWidth: Number = (_tField.width - _tField.textWidth)/2.0;
			var fixTextHeight: Number = (_tField.height - _tField.textHeight)/2.0;
			if (buttonType.isFixedWidth){
				_tField.autoSize = TextFieldAutoSize.CENTER;
				if (!buttonType.isLeftAlign){
					textFormat.align = TextFormatAlign.CENTER;
					_tField.defaultTextFormat = textFormat;
				}
			}
			_tField.wordWrap = buttonType.isFixedWidth;
			if (buttonType.isFixedWidth){
				_width = buttonType.width - _stDrawer.leftBorder - _stDrawer.rightBorder;
				_height = paddingTop + paddingBottom;
				_tField.width = _width - paddingLeft - paddingRight + fixTextWidth + fixTextWidth;
				_tField.x = _stDrawer.leftBorder + paddingLeft - fixTextWidth;
			}else{
				_width = paddingLeft + paddingRight;
				_height = _tField.textHeight + paddingTop + paddingBottom;
				_tField.x = - fixTextWidth + _stDrawer.leftBorder + paddingLeft;
			}
			_tField.y = - fixTextHeight + _stDrawer.topBorder + paddingTop;
		}
		public function make(label: String): Sprite{
			_tField.text = label;
			return makeState();
		}
		protected function makeState(): Sprite{
			var st: Sprite;
			if (_isFixedWidth){
				st = _stDrawer.draw(
					_width, //contentWidth
					_tField.textHeight + _height //contentHeight
				);
			} else {
				st = _stDrawer.draw(
					_tField.textWidth + _width, //contentWidth
					_height //contentHeight
				);
			}
			st.addChild(_tField);
			return st;
		}
	}
}
