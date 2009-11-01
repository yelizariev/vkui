package ru.vkontakte.vkui.button {
	import flash.display.SimpleButton;
	
	/**
	 * @author ivann
	 */
	public class VKSideFilterButton extends SimpleButton{
		private var _emptyState: SideFilterButtonStateEmpty;
		private var _fullState: SideFilterButtonStateFull;
		private var _overState: SideFilterButtonStateOver;
		private var _isSelected: Boolean;

		public function VKSideFilterButton(label: String, isSelected: Boolean = false, width: Number = 134): void{
			_emptyState = new SideFilterButtonStateEmpty(label, width);
			_fullState = new SideFilterButtonStateFull(label, width);
			_overState = new SideFilterButtonStateOver(label, width);
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

