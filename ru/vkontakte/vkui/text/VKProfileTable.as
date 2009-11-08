package ru.vkontakte.vkui.text{
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.display.Sprite;

	/**
	 * @author ivann
	 */
	public class VKProfileTable extends Sprite{
		private var _labelTextFormat: TextFormat;
		private var _dataTextFormat: TextFormat;
		private var _labelWidth: Number;
		private var _dataWidth: Number;
		private var _curY: Number;
		private const DELTA_Y: Number = -3.0;

		public function VKProfileTable(labelWidth: Number = 120, dataWidth: Number = 260){
			super();
			_labelWidth = labelWidth;
			_dataWidth = dataWidth;

			_labelTextFormat = new VKTextFormat();
			_labelTextFormat.color = VKTextColor.GRAY;
			_dataTextFormat = new VKTextFormat();
			_dataTextFormat.color = VKTextColor.BLACK;

			_curY = 0.0;

			//mouseChildren=false;
		}
		public function addRow(labelString: String, dataString: String): TextField{
			var label: TextField = new TextField();
			label.width = _labelWidth;
			label.defaultTextFormat = _labelTextFormat;
			label.autoSize = TextFieldAutoSize.CENTER;
			label.wordWrap = true;
			label.y = _curY;
			label.text = labelString;
			addChild(label);

			var data: TextField = new TextField();
			data.width = _dataWidth;
			data.defaultTextFormat = _dataTextFormat;
			data.autoSize = TextFieldAutoSize.CENTER;
			data.wordWrap = true;
			data.y = _curY;
			data.x = _labelWidth;
			data.text = dataString;
			addChild(data);

			_curY += Math.round(label.height) + DELTA_Y;
			trace('label.height='+label.height);
			trace('label.width='+label.width);

			return data;
		}
	}
}
