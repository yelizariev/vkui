package ru.vkontakte.vkui.button {
	import flash.display.SimpleButton;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	//import flash.events.*;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import ru.vkontakte.vkui.text.*;

	/**
	 * @author ivann
	 * 
	 * Класс можно использовать только для создания 
	 * дочерних классов, т.к. нужно задать 
	 * _upStateDrawer [, _overStateDrawer]
	 * _upTextFormat [, _overTextFormat]
	 */
	internal class VKButton extends SimpleButton {
		private var _label: String = '';
		private var _upText: TextField;
		private var _overText: TextField;
		private var _isUseOverState: Boolean = false;
		protected var _upTextFormat: TextFormat;
		protected var _overTextFormat: TextFormat;
		protected var _upStateDrawer: IVKStateDrawer;
		protected var _overStateDrawer: IVKStateDrawer;
		//paddings:
		protected var _pTop: Number = 3;
		protected var _pBottom: Number = _pTop;
		protected var _pLeft: Number = 8;
		protected var _pRight: Number = _pLeft;

		
		public function VKButton(label: String): void {
			this._label = label;
			this.init();
			this.updateButton();
		}
		
		public function set label(value: String): void {
			_label = value;
			updateButton();
		}
		
		private function init(): void {
			_isUseOverState = Boolean(_overTextFormat) || Boolean(_overStateDrawer);
			_upText = new TextField();
			_upText.wordWrap = false;
			_upText.autoSize = TextFieldAutoSize.LEFT;
			// _upText.gridFitType = GridFitType.SUBPIXEL;
			_upText.defaultTextFormat = _upTextFormat;
			
			if (_isUseOverState){
				_overText = new TextField();
				_overText.wordWrap = false;
				_overText.autoSize = TextFieldAutoSize.LEFT;
				if (_overTextFormat)
					_overText.defaultTextFormat = _overTextFormat;
				else
					_overText.defaultTextFormat = _upTextFormat;
			}
			
			useHandCursor  = true;
		}
		
		private function updateButton(): void {
			upState = makeState(_upText, _upStateDrawer);
			if (_isUseOverState){
				if (_overStateDrawer){
					overState = makeState(_overText, _overStateDrawer);
				}else{
					overState = makeState(_overText, _upStateDrawer);
				}
				downState = hitTestState = overState;
			}else{
				downState = hitTestState = overState = upState;
			}
		}
		private function makeState(tf: TextField, stDrawer: IVKStateDrawer): Sprite{
			tf.text = _label;

			var st: Sprite = stDrawer.draw(
				tf.textWidth + _pLeft + _pRight, //contentWidth
				tf.textHeight + _pTop + _pBottom //contentHeight
			);

			tf.x = - (tf.width - tf.textWidth)/2.0 + stDrawer.leftBorder + _pLeft;
			tf.y = - (tf.height - tf.textHeight)/2.0 + stDrawer.topBorder + _pTop;

			(st as DisplayObjectContainer).addChild(tf);
			return st;
		}
	}
}
