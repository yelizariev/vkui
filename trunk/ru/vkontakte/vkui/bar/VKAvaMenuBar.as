package ru.vkontakte.vkui.bar {
	import ru.vkontakte.vkui.button.VKAvaMenuButton;
	import flash.events.MouseEvent;
	import flash.display.Shape;
	import flash.display.Sprite;

	/**
	 * @author ivann
	 */
	public class VKAvaMenuBar extends Sprite {
		private var _width: Number;
		private var _curY: Number;

		public function VKAvaMenuBar(width: Number = 200){
			_width = width;
			_curY = 0.0;
		}
		public function addMenu(label: String, onClick: Function): VKAvaMenuButton{
			var m: VKAvaMenuButton = new VKAvaMenuButton(label, _width);
			m.y = _curY;
			var func: Function = function(e: MouseEvent): void{ onClick() };
			m.addEventListener(MouseEvent.CLICK, func);
			addChild(m);
			_curY += m.height;
			return m;
		}
	}
}
