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

		protected var _emptyButtonState: ButtonStateNews;
		protected var _overMenuState: ButtonStateNews;

		public function VKMenu(label: String,  countNews: int = 0, width: Number = 118){
			init(width);
			_label = label;
			_countNews = countNews;
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
		private function init(width: Number,
				borderTop: Number = 1,
				borderBottom: Number = 0,
				borderLeft: Number = 0,
				borderRight: Number = 0,
				pTop: Number = 3,
				pBottom: Number = 3,
				pLeft: Number = 6,
				pRight: Number = 6
			): void{
			var buttonType: ButtonType = new ButtonType();
			buttonType.fixedWidthLeft(width);
			var tFormat: TextFormat = new VKTextFormat();
			tFormat.color = VKTextColor.BLUE;
			var emptyStateDrawer: IVKStateDrawer = new EmptyStateDrawer(
				borderTop, 
				borderBottom, 
				borderLeft, 
				borderRight
			);
			_emptyButtonState = new ButtonStateNews(
				buttonType, 
				emptyStateDrawer, tFormat, 
				pTop, pBottom, pLeft, pRight
			);
			var menuOverStateDrawer: IVKStateDrawer = new MenuOverStateDrawer(
				borderTop, 
				borderBottom, 
				borderLeft, 
				borderRight
			);
			_overMenuState = new ButtonStateNews(
				buttonType, 
				menuOverStateDrawer, tFormat, 
				pTop, pBottom, pLeft, pRight
			)
		}
		private function update(): void{
			if (_countNews == 0){
				upState = _emptyButtonState.make(_label);
				downState = hitTestState = overState = _overMenuState.make(_label);
			}else{
				upState = _emptyButtonState.makeNews(_label, _countNews);
				downState = hitTestState = overState = _overMenuState.makeNews(_label, _countNews);
			}
		}
	}
}
