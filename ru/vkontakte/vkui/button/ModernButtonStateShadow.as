package ru.vkontakte.vkui.button {

	/**
	 * @author ivann
	 */
	internal class ModernButtonStateShadow extends ModernButtonState{
		public function ModernButtonStateShadow(bgColor: uint): void{
			super(bgColor);
		}
		protected override function draw(w: Number, h: Number): void{
			super.draw(w, h);
			_graphics.lineStyle(1.0, ButtonColor.MB_BOTTOM_SHADOW);
			_graphics.moveTo(0.0, h+4.0);
			_graphics.lineTo(w+3.0, h+4.0);
		}
	}
}
