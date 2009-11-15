package ru.vkontakte.vkui.text{
	import flash.text.StyleSheet;

	/**
	 * @author ivann
	 */
	public class VKCSS {
		public static const summaryBar: StyleSheet = new StyleSheet;


		//static initializer
		{
			var body: Object = new Object;
			body.fontSize = 11;
			body.fontFamily = 'Tahoma';
			//body.fontFamily = 'Verdana';

			var b: Object = new Object;
			b.color = '#45688E';

			var a: Object = new Object;
			a.color = '#2B587A';

			var a_hover: Object = new Object;
			a_hover.textDecoration = 'underline';

			var dotDivider: Object = new Object; //.divider
			dotDivider.leftMargin = 5;
			dotDivider.rightMargin = 5;
			dotDivider.color = '#777777';

			summaryBar.setStyle('body', body);
			summaryBar.setStyle('b', b);
			summaryBar.setStyle('a', a);
			summaryBar.setStyle('a:hover', a_hover);
			summaryBar.setStyle('.divider', dotDivider);
		}
	}
}
