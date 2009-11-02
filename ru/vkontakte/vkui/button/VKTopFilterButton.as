package ru.vkontakte.vkui.button {
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.text.TextFormat;
	import ru.vkontakte.vkui.text.VKTextFieldMinWidth;
	import ru.vkontakte.vkui.text.VKTextFormat;
	import ru.vkontakte.vkui.text.VKTextColor;
	
	/**
	 * @author ivann
	 */
	public class VKTopFilterButton extends Sprite{
		private var tFieldSelected: VKTextFieldMinWidth;
		private var tFieldNotSelected: VKTextFieldMinWidth;
		private var bgSelected: Shape;

		public function VKTopFilterButton(label: String, selected: Boolean = false) {
			var tFormat: TextFormat = new VKTextFormat();
			tFormat.bold = true;
			tFormat.color = VKTextColor.WHITE;
			tFieldSelected = new VKTextFieldMinWidth(
				tFormat,
				2, // borderTop
				2, // borderLeft

				2, // paddingTop
				3, // paddingBottom
				5, // paddingLeft
				5 // paddingRight
			);
			tFormat.color = VKTextColor.BLUE_BOLD;
			tFieldNotSelected = new VKTextFieldMinWidth(
				tFormat,
				2, // borderTop
				2, // borderLeft

				2, // paddingTop
				3, // paddingBottom
				5, // paddingLeft
				5 // paddingRight
			);
			bgSelected = new Shape();
			addChild(bgSelected);
			addChild(tFieldSelected);
			addChild(tFieldNotSelected);
			tFieldSelected.text = label;
			tFieldNotSelected.text = label;
			draw();
			this.selected = selected;
			buttonMode = true;
			useHandCursor = true;
			mouseChildren = false;
		}
		public function set selected(value: Boolean): void{
			if (value)
				bgSelected.alpha = 1.0;
			else
				bgSelected.alpha = 0.0;
			tFieldSelected.visible = value;
			tFieldNotSelected.visible = !value;
		}
		public function set label(value: String): void{
			tFieldSelected.text = value;
			tFieldNotSelected.text = value;
			bgSelected.graphics.clear();
			draw();
		}

		protected function draw(): void {
			var w: Number = tFieldSelected.contentWidth;
			var h: Number = tFieldSelected.contentHeight;
			var g: Graphics = bgSelected.graphics;
			g.lineStyle(1.0, ButtonColor.TF_OUT_TOP_BORDER);
			g.moveTo(0.0,   0.0);
			g.lineTo(w+3.0, 0.0);
			g.lineStyle(1.0, ButtonColor.TF_OUT_SIDE_BORDER);
			g.lineTo(w+3.0, h+3.0);
			g.lineStyle(1.0, ButtonColor.TF_OUT_BOTTOM_BORDER);
			g.lineTo(0.0,   h+3.0);
			g.lineStyle(1.0, ButtonColor.TF_OUT_SIDE_BORDER);
			g.lineTo(0.0,   0.0);

			g.lineStyle(1.0, ButtonColor.TF_INNER_BORDER);
			g.moveTo(1.0,   1.0);
			g.lineTo(w+2.0, 1.0);
			g.lineTo(w+2.0, h+2.0);
			g.lineTo(1.0,   h+2.0);
			g.lineTo(1.0,   1.0);

			g.beginFill(ButtonColor.TF_BG);
			g.lineStyle(1.0, ButtonColor.TF_BG);
			g.moveTo(2.0,   2.0);
			g.lineTo(2.0,   h+1.0);
			g.lineTo(w+1.0, h+1.0);
			g.lineTo(w+1.0, 2.0);
			g.lineTo(2.0,   2.0);
			g.endFill();

			g.lineStyle(1.0, ButtonColor.TF_BOTTOM_SHADOW);
			g.moveTo(0.0, h+4.0);
			g.lineTo(w+3.0, h+4.0);
		}
	}
}
