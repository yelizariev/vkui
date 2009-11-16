package ru.vkontakte.vkui.text {

	/**
	 * @author ivann
	 */
	public class LinkHandler{
		public var link: String;
		public var handler: Function;
		public function LinkHandler(link: String, handler: Function){
			this.link = link;
			this.handler = handler;
		}
	}
}
