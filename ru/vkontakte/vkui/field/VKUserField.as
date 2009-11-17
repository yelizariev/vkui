package ru.vkontakte.vkui.field {

	/**
	 * @author ivann
	 */
	public class VKUserField extends ATBMask{

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
		}
	}
}
