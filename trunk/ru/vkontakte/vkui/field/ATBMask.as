package ru.vkontakte.vkui.field {
	import flash.display.DisplayObject;
	import flash.display.Shape;

	/**
	 * @author ivann
	 */
	public class ATBMask extends ATB{
		private var _avaMask: Shape;
		private var _height: Number;

		public function ATBMask (
			width: Number, 
			paddingTop: Number,
			paddingBottom: Number,
			paddingLeft: Number, 
			paddingRight: Number,
			borderColor: uint,
			bgColor: uint,
			deltaAvaAndTable: Number,
			tableLabelWidth: Number,
			buttonWidth: Number,
			avaHeight: Number
		){
			_height = BORDER + paddingTop + avaHeight + paddingBottom + BORDER;
			super(
				width,
				paddingTop,
				paddingBottom,
				paddingLeft,
				paddingRight,
				borderColor,
				bgColor,
				deltaAvaAndTable,
				tableLabelWidth,
				buttonWidth
			);
			_avaMask = new Shape();
			_avaMask.graphics.beginFill(0);
			_avaMask.graphics.lineStyle(1, 0);
			_avaMask.graphics.drawRect(0, 0, AVA_WIDTH, avaHeight);
			_avaMask.graphics.endFill();
		}
		override public function set ava(value: DisplayObject): void{
			_content.addChild(_avaMask);
			value.mask = _avaMask;
			super.ava = value;
		}
		override public function get height(): Number{
			return _height;;
		}
	}
}
