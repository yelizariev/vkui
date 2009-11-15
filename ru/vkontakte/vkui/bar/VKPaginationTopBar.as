package ru.vkontakte.vkui.bar {
	import ru.vkontakte.vkui.pagination.VKPagination;

	/**
	 * @author ivann
	 */
	public class VKPaginationTopBar extends PaginationBar {
		public function VKPaginationTopBar(label: String, width: Number = 627, lastIndex: int = 10, countNearPages: uint = 2, firstIndex: int = 1): void{
			super(width, 2, false, lastIndex, countNearPages, firstIndex);
			_pagination.y = 1;
			drawLine(0);
		}
		public function set label(value: String): void{
		}
		public function addLink(label: String, onClick: Function): void{
		}
	}
}
