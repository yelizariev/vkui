package ru.vkontakte.vkui.progress {
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	//import flash.utils.getTimer;

	/**
	 * @author ivann
	 */
	public class VKProgress3 extends Sprite{
		private var _pr1: ProgressRect;
		private var _pr2: ProgressRect;
		private var _pr3: ProgressRect;
		private var _timer: Timer;
		private var _nextFrame: uint;

		//private var _lastTime: int;
		//private var _count: int;


		public function VKProgress3(): void{
			var w: Number = 8.0;//параметры одного прямоугольника
			var h: Number = 4.0;
			var deltaX: Number = 2.0 + w;//расстояние между квадратиками
			var curX: Number = 0.0;
			_pr1 = new ProgressRect(this, curX, w, h);
			curX += deltaX;
			_pr2 = new ProgressRect(this, curX, w, h);
			curX += deltaX;
			_pr3 = new ProgressRect(this, curX, w, h);
			_timer = new Timer(100.0, 0);
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
			visible = false;
		}
		private function onTimer(e: TimerEvent): void{
			next();
		}
		private function next(): void{
			switch (_nextFrame) {
				case 0: 
					_pr1.high();
					_pr2.hide();
					_pr3.hide();
					break;
				case 1: 
					_pr1.middle();
					_pr2.high();
					break;
				case 2: 
					_pr1.low();
					_pr2.middle();
					_pr3.high();
					break;
				case 3: 
					_pr2.low();
					_pr3.middle();
					break;
				case 4: 
					_pr3.low();
					break;
				case 5:
				case 6:
				default:
			}
			_nextFrame = (_nextFrame + 1) % 7;

			//if (_nextFrame == 0){
			//	if (++_count == 10){
			//		trace('average = ' + (getTimer() - _lastTime)/10);
			//		_lastTime = getTimer();
			//		_count = 0;
			//	}
			//}
		}
		public override function set visible(value: Boolean): void{
			super.visible = value;
			if (value){
				_nextFrame = 0;
				next();
				_timer.start();
				//_count = 0;
				//_lastTime = getTimer();
			}else{
				_timer.stop();
			}
		}
	}
}
