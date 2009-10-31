package {
	import flash.display.Sprite;
	import flash.display.*;
	import flash.events.*;
	import ru.vkontakte.vkui.button.*;

	public class VKButtonExample extends Sprite {
		public function VKButtonExample() {
			drawRect(stage.stageWidth, stage.stageHeight);

			var btn: VKSimpleButton = new VKSimpleButton('Event');
			btn.x = 15;
			btn.y = 15;
			btn.addEventListener(MouseEvent.CLICK, function(e: MouseEvent):void {
				trace("btn clicked");
			});
			addChild(btn);

			var btn1: VKSimpleButton = new VKSimpleButton('Изменить Пароль');
			btn1.x = btn.x;
			btn1.y = btn.y + btn.height + 10;
			addChild(btn1);

			var vkmenu: VKMenu = new VKMenu('Мои Друзья', 1);
			vkmenu.x = btn.x;
			vkmenu.y = btn1.y + btn1.height + 10;
			addChild(vkmenu);

			var vkmenu1: VKMenu = new VKMenu('Мои Фотографии');
			vkmenu1.x = btn.x;
			vkmenu1.y = vkmenu.y + vkmenu.height + 2;
			addChild(vkmenu1);

			//VKTab
			var vktab: VKTab = new VKTab('Друзья');
			vktab.x = btn.x;
			vktab.y = vkmenu1.y + vkmenu1.height + 10;
			addChild(vktab);

			var tabb: VKSimpleButton = new VKSimpleButton('selected = true');
			tabb.x = vktab.x + vktab.width + 10;
			tabb.y = vktab.y;
			tabb.addEventListener(MouseEvent.CLICK, function(e: MouseEvent):void{
				vktab.selected = true;
			});
			addChild(tabb);

			var tabb1: VKSimpleButton = new VKSimpleButton('selected = false');
			tabb1.x = tabb.x + tabb.width + 10;
			tabb1.y = vktab.y;
			tabb1.addEventListener(MouseEvent.CLICK, function(e: MouseEvent):void{
				vktab.selected = false;
			});
			addChild(tabb1);

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
    
