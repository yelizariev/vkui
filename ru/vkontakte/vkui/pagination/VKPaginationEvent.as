package ru.vkontakte.vkui.pagination {
	import flash.events.Event;
	
	/**
	 * @author ivann
	 */
	public class VKPaginationEvent extends Event{
		public static const PAGE_CHANGED: String = 'page changed';

		private var _newPage: int;

		public function VKPaginationEvent(newPageNum: int, bubbles:Boolean = false, cancelable:Boolean = false){
			super(PAGE_CHANGED, bubbles, cancelable);
			_newPage = newPageNum;
		}
		public function get pageNum(): int{
			return _newPage;
		}
	}
}
