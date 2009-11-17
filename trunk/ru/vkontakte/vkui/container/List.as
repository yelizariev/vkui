package ru.vkontakte.vkui.container {
	import flash.display.Sprite;
	import flash.display.DisplayObject;

	/**
	 * @author ivann
	 * 
	 * //usage:
	 * container: List = new ru.vkontakte.vkui.container.List([obj1, obj2, obj3]);// obj1, obj2, ojb3 — instances of DisplayObject
	 * container.begin();
	 * obj = container.next();
	 * // configure obj
	 * ...
	 * obj = container.next();
	 * ...
	 * container.end(); //remove unused objects
	 */
	internal class List extends Sprite{
		private var _list: Array;
		private var _listLen: int;
		private var _curIndex: int;
		private var _lastInDisplayList: int;
		private var _deltaY: Number;

		public function List (list: Array, deltaY: Number){
			_list = list;
			_listLen = list.length;
			_lastInDisplayList = -1;
			_deltaY = deltaY;
		}
		public function begin(): void{
			_curIndex = 0;
		}
		public function next(): *{
			if (_curIndex >= _listLen)
				throw new Error('only '+_listLen+' objects available');
			return _list[_curIndex++];
		}
		public function end(): void{
			//добавим в dispay list, кто еще не добавлен
			var i: uint;
			for (i = _lastInDisplayList + 1; i< _curIndex; i++){
				addChild(_list[i] as DisplayObject);
			};
			//удалим лишних
			for (i = _curIndex; i<=_lastInDisplayList; i++){
				removeChild(_list[i] as DisplayObject);
			}
			//подправим координату y
			var curY: Number = 0;
			for (i = 0; i< _curIndex; i++){
				trace("curY="+curY);
				(_list[i] as DisplayObject).y = curY;
				curY += (_list[i] as DisplayObject).height;
				curY += _deltaY;
			}
			_lastInDisplayList = _curIndex - 1;
		}
	}
}
