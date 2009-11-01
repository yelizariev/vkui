package ru.vkontakte.vkui.button {
	import flash.display.SimpleButton;
	
	/**
	 * @author ivann
	 */
	public class VKTabButton extends SimpleButton{
		private var _emptyState: TabStateEmpty;
		private var _fullState: TabStateFull;
		private var _overState: TabStateOver;
		private var _isSelected: Boolean;

		public function VKTabButton(label: String, isSelected: Boolean = false): void{
			_emptyState = new TabStateEmpty(label);
			_fullState = new TabStateFull(label);
			_overState = new TabStateOver(label);
			_isSelected = isSelected;
			updateStates();
		}
		public function set selected(value: Boolean): void{
			_isSelected = value;
			updateStates();
		}
		public function get selected(): Boolean{
			return _isSelected;
		}
		public function set label(value: String): void{
			_emptyState.label = value;
			_fullState.label = value;
			_overState.label = value;
		}
		private function updateStates(): void{
			if (!_isSelected){
				upState = _emptyState;
				downState = hitTestState = overState = _overState;
			}else{
				downState = hitTestState = overState = upState = _fullState;
			}
		}
	}
}

