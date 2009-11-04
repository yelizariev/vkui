package ru.vkontakte.vkui.pagination {
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import ru.vkontakte.vkui.button.PageNumButton;
	
	/**
	 * @author ivann
	 *
	 * x, y — координаты правого верхнего угла данного компонента
	 */
	public class VKPagination extends Sprite{
		private var _countNearPages: uint;
		private var _firstIndex: int;
		private var _lastIndex: int;
		private var _curIndex: int;

		private var _firstPage: PageNumButton;
		private var _pages: Array;
		private var _pagesLength: uint;
		private var _lastPage: PageNumButton;

		public function VKPagination(isTop: Boolean, lastIndex: int, countNearPages: uint = 2, firstIndex: int = 1): void{
			// countNearPages:
			// Если равно 2, то будет отображаться [«] [N-2] [N-1] _N_ [N+1] [N+2] [»]
			// Если равно 1, то будет отображаться [«] [N-1] _N_ [N+1] [»]
			if (lastIndex < firstIndex){
				throw new Error('lastIndex < firstIndex !');
				return;
			}
			_countNearPages = countNearPages;
			_lastIndex = lastIndex;
			_firstIndex = firstIndex;
			_firstPage = new PageNumButton('«', false, isTop);
			_firstPage.addEventListener(MouseEvent.CLICK, onClickFirst);
			_firstPage.visible = false;
			_lastPage = new PageNumButton('»', false, isTop);
			_lastPage.addEventListener(MouseEvent.CLICK, onClickLast);
			_lastPage.visible = false;
			addChild(_firstPage);
			addChild(_lastPage);
			var pageBtn: PageNumButton;
			_pagesLength = countNearPages*2 + 1;
			_pages = new Array(_pagesLength);
			for (var i: uint = 0; i< _pagesLength; i++){
				pageBtn = new PageNumButton('0', false, isTop);
				pageBtn.addEventListener(MouseEvent.CLICK, onClickMiddle);
				pageBtn.visible = false;
				addChild(pageBtn);
				_pages[i] = pageBtn;
			}
			setCurIndex(_firstIndex);
		}
		public function onClickFirst(e: MouseEvent): void{
			dispatchEvent(new VKPaginationEvent(_firstIndex));
			setCurIndex(_firstIndex);
		}
		public function onClickMiddle(e: MouseEvent): void{
			if (e.target.selected)
				return;
			var num: int = int(e.target.num);
			dispatchEvent(new VKPaginationEvent(num));
			setCurIndex(num);
		}
		public function onClickLast(e: MouseEvent): void{
			dispatchEvent(new VKPaginationEvent(_lastIndex));
			setCurIndex(_lastIndex);
		}
		public function set curIndex(value: int): void{
			if (value > _lastIndex){
				throw new Error('curIndex > lastIndex !');
				return;
			}
			if (value < _firstIndex){
				throw new Error('curIndex < firstIndex !');
				return;
			}
			setCurIndex(value);
		}
		public function get curIndex(): int{
			return _curIndex;
		}
		public function set lastIndex(value: int): void{
			if (lastIndex < _firstIndex){
				throw new Error('lastIndex < firstIndex !');
				return;
			}
			setCurIndex(_curIndex);
		}
		public function get lastIndex(): int{
			return _lastIndex;
		}
		private function setCurIndex(value: int): void{
			_curIndex = value;
			var first: int = _curIndex - _countNearPages;
			if (first <= _firstIndex){
				first = _firstIndex;
				_firstPage.visible = false;
			}else{
				_firstPage.visible = true;
			}
			var i: int = 0;
			while (i + first < _curIndex){
				(_pages[i] as DisplayObject).visible = true;
				(_pages[i] as PageNumButton).selected = false;
				i++;
			}
			(_pages[i] as DisplayObject).visible = true;
			(_pages[i] as PageNumButton).selected = true;
			i++;
			while((i<_pagesLength) && (i + first <= _lastIndex) && (i+first <= curIndex+_countNearPages)){
				(_pages[i] as DisplayObject).visible = true;
				(_pages[i] as PageNumButton).selected = false;
				i++;
			}
			_lastPage.visible = (i+first <= _lastIndex)
			while (i < _pagesLength){
				(_pages[i] as DisplayObject).visible = false;
				i++;
			}
			//расположение кнопок
			var curX: Number = 0;
			if (_lastPage.visible){
				curX -= _lastPage.width;
				_lastPage.x = curX;
			}
			for (i = _pagesLength - 1; i>=0; i--){
				if ((_pages[i] as DisplayObject).visible){
					(_pages[i] as PageNumButton).num = i + first;
					curX -= (_pages[i] as PageNumButton).width;
					(_pages[i] as DisplayObject).x = curX;
				}
			}
			if (_firstPage.visible){
				curX -= _firstPage.width;
				_firstPage.x = curX;
			}
		}
	}
}
