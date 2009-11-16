package ru.vkontakte.vkui.field {

	/**
	 * @author ivann
	 *
	 * ATB = Ava Table Buttons
	 */
	public class ATB extends Sprite{
		protected static const AVA_WIDTH: Number = 100;
		private var _content: Sprite;// контейнер, не включающий паддинги
		private var _bg: Graphics;

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

			
			var bgShape: Shape = new Shape();
			_bg = bgShape.graphics;
			addChild(bgShape);

			_content = new Sprite();
			_content.x = _paddingLeft;
			_content.y = _paddingTop;
			addChild(_content);

			_table = new VKProfileTable(tableLabelWidth, 
				width 
				- paddingLeft 
				- AVA_WIDTH 
				- deltaAvaAndTable
				- labelWidth
				- buttonWidth
				- paddingRight 
			);
			_table.x = AVA_WIDTH + deltaAvaAndTable;
			_content.addChild(_table);

			_buttons = VKMenuBar(buttonWidth);
			_buttons.x = width - paddingRight - buttonWidth;
			_content.addChild(_buttons);

		}
		protected function set ava(value: DisplayObject): void{
			if (_ava)
				_content.removeChild(_ava);
			_ava = value;
			_ava.x = 0;
			_ava.y = 0;
			_content.addChild(_ava);
		}
		public function updateBG(): void{
			var w: Number = _paddingLeft + _content.width + _paddingRight;
			var h: Number = _paddingTop + _content.height + _paddingBottom;
			_bg.clear();
			_bg.beginFill(_bgColor);
			_bg.lineStyle(1.0, _borderColor);
			_bg.moveTo(0, 0);
			_bg.lineTo(width-1, 0);
			_bg.lineTo(width-1, height-1);
			_bg.lineTo(0.0, height-1);
			_bg.lineTo(0.0, 0);
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
