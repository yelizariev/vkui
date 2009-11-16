package ru.vkontakte.vkui.bar {
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.events.TextEvent;
	import ru.vkontakte.vkui.pagination.VKPagination;
	import ru.vkontakte.vkui.text.LinkHandler;
	import ru.vkontakte.vkui.text.VKCSS;

	/**
	 * @author ivann
	 */
	public class VKPaginationTopBar extends PaginationBar {
		private var _links: Array = [];//[LinkHandler]
		private var _labelString: String = '';// html-строка, идушая после label 
		private var _linksString: String = '';// html-строка, идушая после label 
		private var _tField: TextField;
		private var _curLinkID: uint = 0;
		private static const PADDING_TOP: Number = 11;
		private static const PADDING_LEFT: Number = 10;

		public function VKPaginationTopBar(label: String, width: Number = 627, lastIndex: int = 10, countNearPages: uint = 2, firstIndex: int = 1): void{
			super(width, PADDING_TOP, true, lastIndex, countNearPages, firstIndex);
			_pagination.y = PADDING_TOP;
			drawLine(_pagination.y + _pagination.height );
			_tField = new TextField;
			_tField.styleSheet = VKCSS.summaryBar;
			_tField.autoSize = TextFieldAutoSize.LEFT;
			_tField.x = PADDING_LEFT - 2; // = PADDING_LEFT - 2(fix padding)
			_tField.y = PADDING_TOP + 1;// 1 = padding(3) - 2(fix padding)
			_tField.addEventListener(TextEvent.LINK, onLink);
			addChild(_tField);
			this.label = label;
		}
		public function set label(value: String): void{
			_labelString = '';
			_labelString += '<span class="bold">';
			_labelString += value; 
			_labelString += '</span>';
			updateHTML()
		}
		public function addLink(label: String, onClick: Function): void{
			var linkEvent: String = 'link_'+String(_curLinkID++);
			var str: String = '';
			str += '<span class="divider">';
			str += ' | ';
			str += '</span>';
			str += '<a href="event:' + linkEvent + '">';
			str += label;
			str += '</a>';
			_linksString += str;
			_links.push(new LinkHandler(linkEvent, onClick));
			updateHTML();
		}
		private function updateHTML(): void{
			var str: String = '';
			str += '<body>';
			str += _labelString;
			str += _linksString;
			str += '</body>';
			_tField.htmlText = str;
			//trace('htmlText='+_tField.htmlText);
		}
		private function onLink(e: TextEvent): void{
			for each (var info: LinkHandler in _links){
				if (info.link == e.text){
					info.handler();
					break;
				}
			}
		}
	}
}
