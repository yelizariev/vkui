package {
	import flash.display.Sprite;
	import flash.display.*;
	import flash.events.*;
	import ru.vkontakte.vkui.button.*;
	import ru.vkontakte.vkui.pagination.*;

	public class PaginationExample extends Sprite {
		public function PaginationExample() {
			drawRect(stage.stageWidth, stage.stageHeight);
			var pagination: VKPagination = new VKPagination(true, 999);
			pagination.addEventListener(VKPaginationEvent.PAGE_CHANGED, function(e:VKPaginationEvent): void{
					trace('pageNum = '+e.pageNum);
				}
			)
			pagination.x = 200;
			pagination.y = 20;
			//pagination.lastIndex = 99;
			pagination.curIndex = 2;
			addChild(pagination);
		}
		private function drawRect(width: Number, height: Number): void {
			graphics.clear();
			graphics.beginFill(0xF7F7F7);
			graphics.lineStyle(1, 0x36638E, 0.8, false, LineScaleMode.NONE, CapsStyle.SQUARE);
			graphics.moveTo(0, 0);
			graphics.lineTo(width - 1, 0);
			graphics.lineTo(width - 1, height - 1);
			graphics.lineTo(0, height);
			graphics.lineTo(0, 0);
			graphics.endFill();
		}
	}
}
    
