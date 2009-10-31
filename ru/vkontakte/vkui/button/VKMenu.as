package ru.vkontakte.vkui.button {
	import flash.display.SimpleButton;
	import flash.text.TextFormat;
	import ru.vkontakte.vkui.text.*;

	/**
	 * @author ivann
	 */
	public class VKMenu extends SimpleButton {
		private var _label: String;
		private var _countNews: int;

		protected var _emptyState: MenuStateEmpty;
		protected var _overState: MenuStateOver;

		public function VKMenu(label: String,  countNews: int = 0, width: Number = 118){
			_label = label;
			_countNews = countNews;
			init(width);
			update();
		}
		public function set countNews (value: uint): void{
			_countNews = value;
			update();
		}
		public function set label (value: String): void{
			_label = value;
			update();
		}
		private function init(width: Number): void{
			_emptyState = new MenuStateEmpty(_label, _countNews,  width);
			_overState = new MenuStateOver(_label, _countNews, width)
			upState = _emptyState;
			downState = hitTestState = overState = _overState;
		}
		private function update(): void{
			_emptyState.update(_label, _countNews);
			_overState.update(_label, _countNews);
		}
	}
}
