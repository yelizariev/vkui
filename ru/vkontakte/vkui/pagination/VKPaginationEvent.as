package ru.vkontakte.vkui.pagination {
	import flash.events.Event;
	
	/**
	 * @author ivann
	 */
	public class VKPaginationEvent extends Event{
		public static const PAGE_CHANGED: String = 'page changed';

		private var _newPage: int;

		public function VKPaginationEvent(newPageNum: int){
			super( PAGE_CHANGED);
			_newPage = newPageNum;
		}
		public function get pageNum(): int{
			return _newPage;
		}
	}
}
