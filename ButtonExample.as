package {
	import flash.display.Sprite;
	import flash.display.*;
	import flash.events.*;
	import ru.vkontakte.vkui.button.*;

	public class ButtonExample extends Sprite {
		public function ButtonExample() {
			drawRect(stage.stageWidth, stage.stageHeight);

			var btn: VKSimpleButton = new VKSimpleButton('Event');
			btn.x = 15;
			btn.y = 15;
			btn.addEventListener(MouseEvent.CLICK, function(e: MouseEvent):void {
				trace("btn clicked"); });
			addChild(btn);

			var btn1: VKSimpleButton = new VKSimpleButton('Изменить Пароль');
			btn1.x = btn.x;
			btn1.y = btn.y + btn.height + 10;
			addChild(btn1);

			var vkmenu: VKMenuButton = new VKMenuButton('Мои Друзья', 1);
			vkmenu.x = btn.x;
			vkmenu.y = btn1.y + btn1.height + 10;
			addChild(vkmenu);

			var vkmenu1: VKMenuButton = new VKMenuButton('Мои Фотографии');
			vkmenu1.x = btn.x;
			vkmenu1.y = vkmenu.y + vkmenu.height + 2;
			addChild(vkmenu1);

			//VKTabButton
			var vktab: VKTabButton = new VKTabButton('Друзья');
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

			//VKAvaMenuButton
			var vkavamenu: VKAvaMenuButton = new VKAvaMenuButton('Фотографии с Павлом (7)');
			vkavamenu.x = btn.x;
			vkavamenu.y = vktab.y + vktab.height + 10;
			addChild(vkavamenu);

			var vkavamenu1: VKAvaMenuButton = new VKAvaMenuButton('Видеозаписи с Павлом (1)');
			vkavamenu1.x = btn.x;
			vkavamenu1.y = vkavamenu.y + vkavamenu.height;
			addChild(vkavamenu1);

			var vkavamenu2: VKAvaMenuButton = new VKAvaMenuButton('Отправить Павлу сообщение');
			vkavamenu2.x = btn.x;
			vkavamenu2.y = vkavamenu1.y + vkavamenu1.height;
			addChild(vkavamenu2);

			//VKBigButton
			var bb: VKBigButton = new VKBigButton('Создать список');
			bb.x = btn.x;
			bb.y = vkavamenu2.y +vkavamenu2.height + 10;
			addChild(bb);

			//VKConfirmButton
			var ok: VKConfirmButton = new VKConfirmButton('Разрешить');
			ok.x = btn.x;
			ok.y = bb.y + bb.height + 10;
			addChild(ok);

			var cancel: VKCancelButton = new VKCancelButton('Отмена');
			cancel.x = ok.x + ok.width + 10
			cancel.y = ok.y;
			addChild(cancel);

			//VKTopFilterButton
			var vktf: VKTopFilterButton = new VKTopFilterButton('Друзья');
			vktf.x = btn.x;
			vktf.y = ok.y + ok.height + 5;
			addChild(vktf);

			var tfb: VKSimpleButton = new VKSimpleButton('selected = true');
			tfb.x = vktab.x + vktab.width + 10;
			tfb.y = vktf.y;
			tfb.addEventListener(MouseEvent.CLICK, function(e: MouseEvent):void{
				vktf.selected = true;
			});
			addChild(tfb);

			var tfb1: VKSimpleButton = new VKSimpleButton('selected = false');
			tfb1.x = tfb.x + tfb.width + 10;
			tfb1.y = vktf.y;
			tfb1.addEventListener(MouseEvent.CLICK, function(e: MouseEvent):void{
				vktf.selected = false;
			});
			addChild(tfb1);

			//VKSideFilterButton
			var vksf: VKSideFilterButton = new VKSideFilterButton('Все друзья');
			vksf.x = btn.x;
			vksf.y = tfb.y + tfb.height + 5;
			addChild(vksf);

			var sfb: VKSimpleButton = new VKSimpleButton('selected = true');
			sfb.x = vksf.x + vksf.width + 10;
			sfb.y = vksf.y;
			sfb.addEventListener(MouseEvent.CLICK, function(e: MouseEvent):void{
				vksf.selected = true;
			});
			addChild(sfb);

			var sfb1: VKSimpleButton = new VKSimpleButton('selected = false');
			sfb1.x = sfb.x + sfb.width + 10;
			sfb1.y = vksf.y;
			sfb1.addEventListener(MouseEvent.CLICK, function(e: MouseEvent):void{
				vksf.selected = false;
			});
			addChild(sfb1);

			//PageNumButtons
			var pageTop1: VKTopPageNumButton = new VKTopPageNumButton('1', true);
			pageTop1.x = 150;
			pageTop1.y = 15;
			addChild(pageTop1);

			var pageTop2: VKTopPageNumButton = new VKTopPageNumButton('2');
			pageTop2.x = pageTop1.x + pageTop1.width;
			pageTop2.y = pageTop1.y;
			addChild(pageTop2);

			var pageBottom1: VKBottomPageNumButton = new VKBottomPageNumButton('1', true);
			pageBottom1.x = pageTop1.x;
			pageBottom1.y = pageTop1.y + pageTop1.height + 5;
			addChild(pageBottom1);

			var pageBottom2: VKBottomPageNumButton = new VKBottomPageNumButton('2');
			pageBottom2.x = pageTop2.x;
			pageBottom2.y = pageTop2.y + pageTop2.height + 5;
			addChild(pageBottom2);
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
    
