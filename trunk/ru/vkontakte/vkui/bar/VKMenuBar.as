package ru.vkontakte.vkui.bar {
	import ru.vkontakte.vkui.button.VKMenuButton;
	import flash.events.MouseEvent;
	import flash.display.Shape;
	import flash.display.Sprite;

	/**
	 * @author ivann
	 */
	public class VKMenuBar extends Sprite {
		private var _width: Number;
		private var _curY: Number;

		public function VKMenuBar(width: Number = 118){
			_width = width;
			_curY = 0.0;
		}
		public function addMenu(label: String, onClick: Function): VKMenuButton{
			var m: VKMenuButton = new VKMenuButton(label, 0, _width);
			m.y = _curY;
			var func: Function = function(e: MouseEvent): void{ onClick() };
			m.addEventListener(MouseEvent.CLICK, func);
			addChild(m);
			_curY += m.height + 1.0;//1.0 — расстояние между элементами
			return m;
		}
		public function addLine(): void{
			_curY += 3.0;
			var sh: Shape = drawLine();
			sh.y = _curY;
			addChild(sh);
			_curY += 3.0;
		}
		private function drawLine(): Shape{
			var sh: Shape = new Shape();
			sh.graphics.lineStyle(1.0, 0xCCCCCC, 1.0, true);
			sh.graphics.moveTo(0.0, 0.0);
			sh.graphics.lineTo(_width - 1.0, 0.0);
			return sh;
		}
	}
}
