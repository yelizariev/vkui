package {
	import flash.display.Sprite;
	import flash.display.*;
	import flash.events.*;
	import ru.vkontakte.vkui.button.*;
	import ru.vkontakte.vkui.bar.*;

	public class BarExample extends Sprite {
		public function BarExample() {
			drawRect(stage.stageWidth, stage.stageHeight);
			var vkmenu: VKMenuBar = new VKMenuBar();
			vkmenu.addMenu('Моя Страница', function ():void{trace('Моя Страница')});
			vkmenu.addMenu('Мои Друзья', function ():void{trace('Мои Друзья')});
			vkmenu.addMenu('Мои Фотография', function ():void{trace('Мои Фотография')});
			vkmenu.addMenu('Мои Видеозаписи', function ():void{trace('Мои Видеозаписи')});
			vkmenu.addLine();
			vkmenu.addMenu('Приложения', function ():void{trace('Приложения')});
			vkmenu.x = 30;
			vkmenu.y = 30;
			addChild(vkmenu);

			var vkAvaMenu: VKAvaMenuBar = new VKAvaMenuBar();
			vkAvaMenu.addMenu('Фотографии с Павлом (7)', function ():void{trace('1')});
			vkAvaMenu.addMenu('Видеозаписи с Павлом (1)', function ():void{trace('2')});
			vkAvaMenu.addMenu('Отправить Павлу сообщение', function ():void{trace('3')});
			vkAvaMenu.x = vkmenu.x + vkmenu.width + 30;
			vkAvaMenu.y = vkmenu.y;
			addChild(vkAvaMenu);
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
    
