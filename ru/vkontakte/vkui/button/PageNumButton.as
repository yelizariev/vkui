package ru.vkontakte.vkui.button {
	import flash.display.SimpleButton;
	
	/**
	 * @author ivann
	 */
	public class PageNumButton extends SimpleButton{
		private var _emptyState: PageNumButtonState;
		private var _curState: PageNumButtonStateCurrent;
		private var _overState: PageNumButtonState;;
		private var _isSelected: Boolean;
		private var _num: int;

		public function PageNumButton(label: String, isSelected: Boolean, isTop: Boolean): void{
			_emptyState = new PageNumButtonState(label, isTop, false);
			_curState = new PageNumButtonStateCurrent(label, isTop);
			_overState = new PageNumButtonState(label, isTop, true);
			this.selected = isSelected;
		}
		public function set selected(value: Boolean): void{
			_isSelected = value;
			useHandCursor = !value;
			mouseEnabled = !value;
			updateStates();
		}
		public function get selected(): Boolean{
			return _isSelected;
		}
		public function set label(value: String): void{
			_emptyState.label = value;
			_curState.label = value;
			_overState.label = value;
		}
		public function set num(value: int): void{
			this.label = String(value);
			_num = value;
		}
		public function get num(): int{
			return _num;
		}
		public override function get width(): Number{
			if (_isSelected)
				return _curState.width;
			else
				return _overState.width;
		}
		private function updateStates(): void{
			if (!_isSelected){
				upState = _emptyState;
				downState = hitTestState = overState = _overState;
			}else{
				downState = hitTestState = overState = upState = _curState;
			}
		}
	}
}

