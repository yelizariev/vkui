package ru.vkontakte.vkui.button {
	import flash.display.Sprite;
	import flash.display.Shape;

	/**
	 * @author ivann
	 */
	internal class MenuOverStateDrawer extends ToggleButtonOverStateDrawer{

		public function MenuOverStateDrawer(top: Number, bottom: Number, left: Number, right: Number): void{
			super(1, 0, 0, 0);//border
		}
		public override function draw(contentWidth: Number, contentHeight: Number): Sprite {
			var color: uint = 0xCAD1D9;
			var st: Sprite = super.draw(contentWidth, contentHeight);
			var shape: Shape = new Shape();
			shape.graphics.beginFill(color);
			shape.graphics.moveTo(0, 0);
			shape.graphics.lineStyle(1, color);
			shape.graphics.lineTo(st.width, 0);
			shape.graphics.endFill();
			shape.x = 0;
			shape.y = 0;
			st.addChild(shape);
			return st;
		}
	}
}
