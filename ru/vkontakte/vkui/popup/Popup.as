package ru.vkontakte.vkui.popup{
	import flash.display.Graphics;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextFormat;
	import ru.vkontakte.vkui.text.VKTextFieldFixedWidth;
	import ru.vkontakte.vkui.text.VKTextFormat;

	/**
	 * @author ivann
	 */
	public class Popup extends Sprite{
		private var _popup: Sprite;
		private var _tranparentBG: Shape;

		public function Popup(
			title: String, 
			content: DisplayObject, 
			buttons: Array,

			paddingTop: Number, 
			paddingBottom: Number, 
			paddingLeft: Number,
			paddingRight: Number
		){
			super.x = 0;
			super.y = 0;
			visible = false;
			var contentWidth: Number = content.width + paddingLeft + paddingRight;
			var contentHeight: Number = content.height + paddingTop + paddingBottom;
			var borderSize: Number = 10.0;
			var tFormat: TextFormat = new VKTextFormat();
			tFormat.color = 0xFFFFFF;
			tFormat.size = 13;
			tFormat.bold = true;
			var tField: VKTextFieldFixedWidth = new VKTextFieldFixedWidth(
				tFormat,
				contentWidth + 2,
				2, //borderTop
				2, //borderBottom
				1, //borderLeft
				1, //borderRight
				4, //paddingTop
				7, //paddingBottom  //должно быть 5
				10, //paddingLeft
				10  //paddingRight
			);
			tField.text = title;
			_tranparentBG = new Shape();
			var titleBG: Shape = drawTitleBG(tField.contentWidth, tField.contentHeight);
			var contentBG: Shape = drawContentBG(contentWidth, contentHeight);
			var buttonsBG: Shape = drawButtonsBG(contentWidth, 40);
			var borderRect: Shape = drawRect(
				2*borderSize + contentWidth,
				2*borderSize + titleBG.height + contentBG.height + buttonsBG.height, 
				PopupColor.TRANSPARENT_BORDER, 
				PopupColor.TRANSPARENT_BORDER_ALPHA
			);
			titleBG.x = borderSize;
			titleBG.y = borderSize;
			tField.x += titleBG.x;
			tField.y += titleBG.y;
			contentBG.x = borderSize;
			contentBG.y = titleBG.y + titleBG.height;
			buttonsBG.x = borderSize;
			buttonsBG.y = contentBG.y + contentBG.height;
			_popup = new Sprite();
			_popup.addChild(borderRect);
			_popup.addChild(titleBG);
			_popup.addChild(tField);
			_popup.addChild(contentBG);
			_popup.addChild(buttonsBG);
			addChild(_tranparentBG);
			addChild(_popup);
		}
		public override function set x(value: Number): void{
			_popup.x = value;
		}
		public override function set y(value: Number): void{
			_popup.y = value;
		}
		public override function get x(): Number{
			return _popup.x;
		}
		public override function get y(): Number{
			return _popup.y;
		}
		public function show(stageWidth: Number, stageHeight: Number):  void{
			_tranparentBG.graphics.clear();

			_tranparentBG.graphics.beginFill(0, 0.0);
			_tranparentBG.graphics.lineStyle(1.0, 0, 0.0, true);
			_tranparentBG.graphics.moveTo(0.0, 0.0);
			_tranparentBG.graphics.lineTo(stageWidth - 1.0, 0.0);
			_tranparentBG.graphics.lineTo(stageWidth - 1.0, stageHeight - 1.0);
			_tranparentBG.graphics.lineTo(0.0, stageHeight - 1.0);
			_tranparentBG.graphics.lineTo(0.0, 0.0);
			_tranparentBG.graphics.endFill();

			visible = true;
		}
		public function hide(): void{
			visible = false;
		}
		private function drawRect(w: Number, h: Number, color: uint, alpha: Number): Shape{
			var sh: Shape = new Shape();
			sh.graphics.beginFill(color, alpha);
			sh.graphics.lineStyle(1.0, color, alpha, true);
			sh.graphics.moveTo(0.0, 0.0);
			sh.graphics.lineTo(w - 1.0, 0.0);
			sh.graphics.lineTo(w - 1.0, h - 1.0);
			sh.graphics.lineTo(0.0, h - 1.0);
			sh.graphics.lineTo(0.0, 0.0);
			sh.graphics.endFill();
			return sh;
		}
		private function drawTitleBG(w: Number, h: Number): Shape{
			// h = высота содержимого с учетом, что borderTop = borderBottom = 2
			var sh: Shape = new Shape();
			w+=2;
			h+=4;// 1+1 + contentHeight + 1+1 
			sh.graphics.beginFill(PopupColor.TITLE_BG);
			sh.graphics.lineStyle(1.0, PopupColor.TITLE_OUT_BORDER, 1.0, true);
			sh.graphics.moveTo(0.0, 0.0);
			sh.graphics.lineTo(w - 1.0, 0.0);
			sh.graphics.lineTo(w - 1.0, h - 1.0);
			sh.graphics.lineTo(0.0, h - 1.0);
			sh.graphics.lineTo(0.0, 0.0);
			sh.graphics.endFill();

			sh.graphics.lineStyle(1.0, PopupColor.TITLE_TOP_BORDER, 1.0, true);
			sh.graphics.moveTo(1.0, 1.0);
			sh.graphics.lineTo(w - 2.0, 1.0);
			sh.graphics.lineStyle(1.0, PopupColor.TITLE_BOTTOM_BORDER, 1.0, true);
			sh.graphics.moveTo(1.0, h - 2.0);
			sh.graphics.lineTo(w - 2.0, h - 2.0);
			return sh;
		}
		private function drawContentBG(w: Number, h: Number): Shape{
			var sh: Shape = new Shape();
			w+=2;
			var bgColor: uint = 0xFFFFFF;
			sh.graphics.beginFill(bgColor);
			sh.graphics.lineStyle(1.0, PopupColor.CONTENT_SIDE_BORDER, 1.0, true);
			sh.graphics.moveTo(0.0, 0.0);
			sh.graphics.lineTo(w - 1.0, 0.0);
			sh.graphics.lineTo(w - 1.0, h - 1.0);
			sh.graphics.lineTo(0.0, h - 1.0);
			sh.graphics.lineTo(0.0, 0.0);
			sh.graphics.endFill();

			sh.graphics.lineStyle(1.0, bgColor, 1.0, true);
			sh.graphics.moveTo(1.0, 0.0);
			sh.graphics.lineTo(w - 2.0, 0.0);
			sh.graphics.moveTo(1.0, h - 1.0);
			sh.graphics.lineTo(w - 2.0, h - 1.0);
			return sh;
		}
		private function drawButtonsBG(w: Number, h: Number): Shape{
			var sh: Shape = new Shape();
			w+=2;
			h+=2;
			sh.graphics.beginFill(PopupColor.BUTTONS_TOP_BG);
			sh.graphics.lineStyle(1.0, PopupColor.CONTENT_SIDE_BORDER, 1.0, true);
			sh.graphics.moveTo(0.0, 0.0);
			sh.graphics.lineTo(w - 1.0, 0.0);
			sh.graphics.lineTo(w - 1.0, h - 1.0);
			sh.graphics.lineTo(0.0, h - 1.0);
			sh.graphics.lineTo(0.0, 0.0);
			sh.graphics.endFill();

			sh.graphics.lineStyle(1.0, PopupColor.BUTTONS_TOP_BORDER, 1.0, true);
			sh.graphics.moveTo(1.0, 0.0);
			sh.graphics.lineTo(w - 2.0, 0.0);
			return sh;
		}
	}
}
