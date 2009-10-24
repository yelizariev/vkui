package ru.vkontakte.vkui.button {
	import flash.display.Sprite;

	/**
	 * @author ivann
	 */
	internal class ToggleButtonOverStateDrawer extends EmptyStateDrawer{

		public function ToggleButtonOverStateDrawer(top: Number, bottom: Number, left: Number, right: Number): void{
			super(top, bottom, left, right);//border
		}
		public override function draw(contentWidth: Number, contentHeight: Number): Sprite {
			var st: Sprite = super.draw(contentWidth, contentHeight);
			st.alpha = 1;
			return st;
		}
	}
}
