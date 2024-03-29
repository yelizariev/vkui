package {
	import flash.display.Sprite;
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import ru.vkontakte.vkui.text.*;
	import ru.vkontakte.vkui.button.*;
	import ru.vkontakte.vkui.bar.*;
	import ru.vkontakte.vkui.field.*;
	import ru.vkontakte.vkui.pagination.VKPaginationEvent;

	public class FieldExample extends Sprite {
		public function FieldExample() {
			drawRect(stage.stageWidth, stage.stageHeight);

			var user: VKUserField = new VKUserField(400 /*width*/, 70/*tableLabelWidth*/, 130/*buttonsWidth*/);
			var nameTextField: TextField = user.table.addRow('Имя:');
			nameTextField.styleSheet = VKCSS.main;
			nameTextField.htmlText = '<body><a href="event:id1">Павел Дуров</a></body>';
			nameTextField.addEventListener(TextEvent.LINK, function(e: TextEvent): void{
				navigateToURL(new URLRequest('http://vkontakte.ru/'+e.text), '_blank');
			})
			user.table.addRow('Выпуск:', "СПбГУ '06");
			user.buttons.addMenu('Отправить сообщение', function(): void{trace('send msg')});
			user.buttons.addMenu('Убрать из друзей', function(): void{trace('unfriend')});
			user.updateBG();
			user.x = 10;
			user.y = 10;
			addChild(user);
			var loader: Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e: Event): void{
				user.ava = (e.target as LoaderInfo).content;
				user.updateBG();
				trace('user.height='+user.height);
			})
			loader.load(new URLRequest('http://cs136.vkontakte.ru/u00001/b_193fa166.jpg'));
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
    
