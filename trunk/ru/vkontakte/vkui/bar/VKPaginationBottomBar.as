package ru.vkontakte.vkui.bar {
	import ru.vkontakte.vkui.pagination.VKPagination;
	import flash.display.Shape;

	/**
	 * @author ivann
	 */
	public class VKPaginationBottomBar extends PaginationBar {
		public function VKPaginationBottomBar(width: Number = 627, lastIndex: int = 10, countNearPages: uint = 2, firstIndex: int = 1): void{
			super(width, 2, false, lastIndex, countNearPages, firstIndex);
			_pagination.y = 1;
			drawLine(0);
		}
	}
}
