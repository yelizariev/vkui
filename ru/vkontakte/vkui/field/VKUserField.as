package ru.vkontakte.vkui.field {

	/**
	 * @author ivann
	 */
	public class VKUserField extends ATBMask{
		private var _avaMask: Shape;

		public function VKUserField (
			width: Number, 
			tableLabelWidth: Number,
			buttonWidth: Number
		){
			super(
				width,
				5, // paddingTop
				4, // paddingBottom
				4, // paddingLeft
				4, // paddingRight
				0xDAE2E8, //borderColor
				0xFFFFFF, //bgColor
				8, //deltaAvaAndTable
				tableLabelWidth,
				buttonWidth,
				100 //avaHeight
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
