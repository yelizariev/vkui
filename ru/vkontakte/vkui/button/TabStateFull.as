package ru.vkontakte.vkui.button {
	import ru.vkontakte.vkui.text.VKTextColor;
	
	/**
	 * @author ivann
	 */
	internal class TabStateFull extends TabState{
		public function TabStateFull(label: String): void{
			super(label, VKTextColor.WHITE, ButtonColor.SB_BG);
		}
		protected override function draw(contentWidth: Number, contentHeight: Number): void{
			line(0, contentWidth, 1, ButtonColor.SB_CORNER);
			line(1, contentWidth, 0, ButtonColor.SB_CORNER);
			super.draw(contentWidth, contentHeight);
		}
	}
}
