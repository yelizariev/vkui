package {
	import flash.display.Sprite;
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import ru.vkontakte.vkui.text.*;
	import ru.vkontakte.vkui.button.*;
	import ru.vkontakte.vkui.field.*;
	import ru.vkontakte.vkui.container.*;

	public class ContainerExample extends Sprite {
		private var _ufContainer: VKUserFieldContainer;
		public function ContainerExample() {
			drawRect(stage.stageWidth, stage.stageHeight);

			var btn2: VKSimpleButton = new VKSimpleButton('2');
			btn2.addEventListener(MouseEvent.CLICK, function(e: MouseEvent): void{
				createUserFields(2);
			})
			btn2.x = 10;
			btn2.y = 10;
			addChild(btn2);

			var btn3: VKSimpleButton = new VKSimpleButton('3');
			btn3.addEventListener(MouseEvent.CLICK, function(e: MouseEvent): void{
				createUserFields(3);
			})
			btn3.x = btn2.y + btn2.width + 10;
			btn3.y = 10;
			addChild(btn3);

			_ufContainer = new VKUserFieldContainer(
				400, //width
				70, //tableLabelWidth
				130, //buttonsWidth
				3 //maxChilds
			);
			_ufContainer.x = 10;
			_ufContainer.y = btn2.y + btn2.height + 20;
			trace("y="+_ufContainer.y);
			addChild(_ufContainer);
			initUFContainer(3);
		}
		private function createUserFields(count: uint): void{
			_ufContainer.begin();
			for (var i: uint = 1; i<=count; i++)
				updateUserField(_ufContainer.next());
			_ufContainer.end();

		}
		private function initUFContainer(count: uint): void{
			_ufContainer.begin();
			for (var i: uint = 1; i<=count; i++)
				initUserField(_ufContainer.next());
			
			_ufContainer.end();
		}
		private function initUserField(user: VKUserField): void{
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
			var loader: Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e: Event): void{
				user.ava = (e.target as LoaderInfo).content;
				user.updateBG();
			})
			loader.load(new URLRequest('http://cs136.vkontakte.ru/u00001/b_193fa166.jpg'));
		}
		private function updateUserField(user: VKUserField): void{
			var nameTextField: TextField = user.table.getTextFieldAt(1);
			nameTextField.text = "СПбГУ '" + String(uint(Math.random()*99));
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
    
