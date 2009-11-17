package ru.vkontakte.vkui.field {
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import ru.vkontakte.vkui.bar.VKMenuBar;
	import ru.vkontakte.vkui.text.VKProfileTable;

	/**
	 * @author ivann
	 *
	 * ATB = Ava Table Buttons
	 */
	public class ATB extends Sprite{
		protected static const AVA_WIDTH: Number = 100;
		protected static const BORDER: Number = 1.0;
		protected var _avaHeight: Number;
		protected var _content: Sprite;// контейнер, не включающий паддинги
		private var _bg: Graphics;
		private var _bgWidth: Number;
		protected var _bgHeight: Number;

		private var _ava: DisplayObject;
		private var _table: VKProfileTable;
		private var _buttons: VKMenuBar;

		private var _paddingTop: Number;
		private var _paddingBottom: Number;
		private var _paddingLeft: Number;
		private var _paddingRight: Number;
		private var _bgColor: uint;
		private var _borderColor: uint;

		public function ATB (
			width: Number, 
			paddingTop: Number,
			paddingBottom: Number,
			paddingLeft: Number, 
			paddingRight: Number,
			borderColor: uint,
			bgColor: uint,
			deltaAvaAndTable: Number,
			tableLabelWidth: Number,
			buttonWidth: Number
		){
			_paddingTop = paddingTop;
			_paddingBottom = paddingBottom;
			_paddingLeft = paddingLeft;
			_paddingRight = paddingRight;
			_bgColor = bgColor;
			_borderColor = borderColor;
			_bgWidth = width;

			
			var bgShape: Shape = new Shape();
			_bg = bgShape.graphics;
			addChild(bgShape);

			_content = new Sprite();
			_content.x = BORDER + _paddingLeft;
			_content.y = BORDER + _paddingTop;
			addChild(_content);

			var contentWidth: Number = 
				width 
				- BORDER
				- paddingLeft 
				- paddingRight 
				- BORDER;
			_table = new VKProfileTable(tableLabelWidth, 
				contentWidth 
				- AVA_WIDTH 
				- deltaAvaAndTable
				- tableLabelWidth
				- buttonWidth
			);
			_table.x = AVA_WIDTH + deltaAvaAndTable;
			_content.addChild(_table);

			_buttons = new VKMenuBar(buttonWidth);
			_buttons.x = contentWidth - buttonWidth;
			_content.addChild(_buttons);
		}
		public function set ava(value: DisplayObject): void{
			if(_ava)
				_content.removeChild(_ava);
			_ava = value;
			_ava.x = 0;
			_ava.y = 0;
			_content.addChild(_ava);
		}
		public function updateBG(): void{
			var h: Number = _content.height;
			if (_ava){
				if (_ava.mask){
					h = Math.max(_ava.mask.height, _table.height, _buttons.height)
				}
			}
			h += BORDER + _paddingTop + _paddingBottom + BORDER;
			if (h == _bgHeight)
				return;
			_bgHeight = h;
			_bg.clear();
			_bg.beginFill(_bgColor);
			_bg.lineStyle(1.0, _borderColor);
			_bg.moveTo(0, 0);
			_bg.lineTo(_bgWidth-1, 0);
			_bg.lineTo(_bgWidth-1, h-1);
			_bg.lineTo(0, h-1);
			_bg.lineTo(0, 0);
			_bg.endFill();
		}
		public function get table(): VKProfileTable{
			return _table;
		}
		public function get buttons(): VKMenuBar{
			return _buttons;
		}
	}
}
