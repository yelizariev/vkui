package ru.vkontakte.vkui.bar {
	import ru.vkontakte.vkui.pagination.VKPagination;
	import ru.vkontakte.vkui.pagination.VKPaginationEvent;
	import flash.display.Shape;
	import flash.display.Sprite;

	/**
	 * @author ivann
	 */
	internal class PaginationBar extends Sprite {
		protected var _width: Number;
		protected var _pagination: VKPagination;
		private var _paginationWidth: Number;
		private static const PADDING_LEFT: Number = 10;

		public function PaginationBar(width: Number, paddingY: Number, isTop: Boolean, lastIndex: int, countNearPages: uint, firstIndex: int): void{
			_width = width;
			_pagination = new VKPagination(isTop, lastIndex, countNearPages, firstIndex);
			drawRect(_pagination.height + 1 + paddingY);//1 — высота линии
			addChild(_pagination);
			_pagination.x = _width - PADDING_LEFT;
		}
		public function get pagination(): VKPagination{
			return _pagination;
		}
		protected function drawLine(y: Number): void{
			var sh: Shape = new Shape();
			sh.graphics.lineStyle(1.0, 0xDAE2E8, alpha);
			sh.graphics.moveTo(0, 0);
			sh.graphics.lineTo(_width, 0);
			sh.y = y;
			addChild(sh);
		}
		private function drawRect(height: Number): void{
			var sh: Shape = new Shape();
			sh.graphics.beginFill(0xFFFFFF);
			sh.graphics.lineStyle(1.0, 0xFFFFFF);
			sh.graphics.moveTo(0, 0);
			sh.graphics.lineTo(_width-1, 0);
			sh.graphics.lineTo(_width-1, height - 1);
			sh.graphics.lineTo(0, height - 1);
			sh.graphics.lineTo(0, 0);
			sh.graphics.endFill();
			addChild(sh);
		}
	}
}
