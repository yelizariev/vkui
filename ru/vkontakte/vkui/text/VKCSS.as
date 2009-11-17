package ru.vkontakte.vkui.text{
	import flash.text.StyleSheet;

	/**
	 * @author ivann
	 */
	public class VKCSS {
		public static const summaryBar: StyleSheet = new StyleSheet;
		public static const main: StyleSheet = new StyleSheet;

		//static initializer
		{
			summaryBar.setStyle('body', body);
			summaryBar.setStyle('.bold', dotBold);
			summaryBar.setStyle('a', a);
			summaryBar.setStyle('a:hover', a_hover);
			summaryBar.setStyle('.divider', dotDivider);

			main.setStyle('body', body);
			main.setStyle('.bold', dotBold);
			main.setStyle('a', a);
			main.setStyle('a:hover', a_hover);
		}

		//private
		private static const body: Object = {
			fontSize : 11,
			fontFamily : 'Tahoma'
			//fontFamily : 'Verdana'
		};
		private static const dotBold: Object = {
			fontWeight : 'bold',
			color : '#45688E'
		};
		private static const a: Object = {
			color : '#2B587A'
		};
		private static const a_hover: Object = {
			textDecoration : 'underline'
		};
		private static const dotDivider: Object = {
			//marginLeft : 5,
			//marginRight : 5,
			color : '#777777'
		};
	}
}
