package ru.vkontakte.vkui.button {
	import flash.display.Sprite;
	import flash.display.Shape;
	
	/**
	 * @author ivann
	 */
	internal class VKSimpleButtonStateDrawer implements IVKStateDrawer {

		public function get leftBorder(): Number{
			return 0;
		}
		public function get rightBorder(): Number{
			return 0;
		}
		public function get topBorder(): Number{
			return 2;
		}

		public function draw(contentWidth: Number, contentHeight: Number): Sprite {
			contentWidth = Math.round(contentWidth);
			contentHeight = Math.round(contentHeight);
			var st: Sprite = new Sprite();
			var nc1: Shape;
			var nc2: Shape;
			var curY: Number=0;

			nc1 = this.nc1(contentWidth);
			nc1.y = curY;
			st.addChild(nc1);
			curY+=1;

			nc2 = this.nc2(contentWidth);
			nc2.y = curY;
			st.addChild(nc2);
			curY+=1;

			var ncc: Shape = this.ncc(contentWidth, contentHeight);
			ncc.y = curY;
			st.addChild(ncc);
			curY+=contentHeight;

			nc2 = this.nc2(contentWidth);
			nc2.y = curY;
			st.addChild(nc2);
			curY+=1;

			nc1 = this.nc1(contentWidth);
			nc1.y = curY;
			st.addChild(nc1);
			
			return st;
		}
		private function ncc(width: Number, height: Number): Shape{
			var ncc: Shape = new Shape();
			ncc.graphics.beginFill(VKSimpleButtonColor.BG);
			ncc.graphics.lineStyle();
			ncc.graphics.moveTo(0, 0);
			ncc.graphics.lineTo(width , 0);
			ncc.graphics.lineTo(width , height);
			ncc.graphics.lineTo(0, height);
			ncc.graphics.lineTo(0, 0);
			ncc.graphics.endFill();
			return ncc;
		}
		private function nc1(width: Number): Shape{
			var nc1: Shape = new Shape();

			nc1.graphics.beginFill(VKSimpleButtonColor.CORNER);
			nc1.graphics.lineStyle(1, VKSimpleButtonColor.CORNER);
			nc1.graphics.moveTo(1, 0);
			nc1.graphics.lineTo(width-1, 0);
			nc1.graphics.endFill();

			nc1.graphics.beginFill(VKSimpleButtonColor.BG);
			nc1.graphics.lineStyle(1, VKSimpleButtonColor.BG);
			nc1.graphics.moveTo(2, 0);
			nc1.graphics.lineTo(width-2, 0);
			nc1.graphics.endFill();

			return nc1;
		}
		private function nc2(width: Number): Shape{
			var nc2: Shape = new Shape();
			nc2.graphics.beginFill(VKSimpleButtonColor.CORNER);
			nc2.graphics.lineStyle(1, VKSimpleButtonColor.CORNER);
			nc2.graphics.moveTo(0, 0);
			nc2.graphics.lineTo(width, 0);
			nc2.graphics.endFill();

			nc2.graphics.beginFill(VKSimpleButtonColor.BG);
			nc2.graphics.lineStyle(1, VKSimpleButtonColor.BG);
			nc2.graphics.moveTo(1, 0);
			nc2.graphics.lineTo(width-1, 0);
			nc2.graphics.endFill();

			return nc2;
		}
	}
}
