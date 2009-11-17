package ru.vkontakte.vkui.container {
	import ru.vkontakte.vkui.field.VKUserField;

	/**
	 * @author ivann
	 */
	public class VKUserFieldContainer extends List{
		public function VKUserFieldContainer(width: Number, tableLabelWidth: Number, buttonWidth: Number, maxChilds: uint, deltaY: Number = 8): void{
			var list: Array = [];
			for (var i: uint = 0; i<maxChilds; i++){
				list.push(new VKUserField(width, tableLabelWidth, buttonWidth));
			}
			super(list, deltaY);
		}
	}
}
