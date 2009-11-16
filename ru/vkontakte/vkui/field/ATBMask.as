package ru.vkontakte.vkui.field {

	/**
	 * @author ivann
	 */
	public class ATBMask extends ATB{
		private var _avaMask: Shape;

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
			buttonWidth: Number,
			avaHeight: Number
		){
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
			_avaMask.graphics.drawRect(AVA_WIDTH, avaHeight);
			_avaMask.graphics.endFill();
		}
		override protected function set ava(value: DisplayObject): void{
			addChild(_avaMask);
			_ava.mask = _avaMask;
			super(_ava);
		}
	}
}
