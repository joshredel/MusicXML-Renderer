package org.cim.old {
	import mx.core.UIComponent;
	
	public class Page extends UIComponent {
		/**
		 * The systems that are part of this page.
		 */
		public var systems:Array = new Array();
		
		/**
		 * The renderer drawing this page.
		 */
		public var renderer:ScoreRenderer;
		
		/**
		 * Constructor
		 */
		public function Page(renderer:ScoreRenderer):void {
			this.renderer = renderer;
		}
		
		/**
		 * Draws the overlay for this page based on its elements.
		 */
		public function draw():void {
			// draw the page
			graphics.beginFill(0x999999, 0.3)
			graphics.drawRect(0, 0, renderer.pageWidth, renderer.pageHeight);
			graphics.endFill();
			
			// draw the margins
			var pageMarginWidth:int = renderer.pageWidth - renderer.evenPageMargins.left - renderer.evenPageMargins.right;
			var pageMarginHeight:int = renderer.pageHeight - renderer.evenPageMargins.top - renderer.evenPageMargins.bottom;
			graphics.beginFill(0x999999, 0.3)
			graphics.drawRect(renderer.evenPageMargins.left, renderer.evenPageMargins.top, 
							  pageMarginWidth, pageMarginHeight);
			graphics.endFill();
			
			// draw the systems
			var runningY:int = renderer.topSystemDistance;
			
			for(var i:int = 0; i < systems.length; i++) {
				// check if there is a special layout for this system
				var measure:Measure = systems[i].measures[0] as Measure;
				var addedLeftMargin:int = 0;
				var addedRightMargin:int = 0;
				if(measure.systemLayout) {
					// there is a special layout addition to the standard amounts
					if(measure.systemLayout.hasOwnProperty("system-margins")) {
						// check for left margins
						if(measure.systemLayout['system-margins'].hasOwnProperty("left-margin")) {
							addedLeftMargin = measure.systemLayout['system-margins']['left-margin'];
						}
						
						// check for right margins
						if(measure.systemLayout['system-margins'].hasOwnProperty("right-margin")) {
							addedRightMargin = measure.systemLayout['system-margins']['right-margin'];
						}
					}
					
					// check for a different top system distance
					if(measure.systemLayout.hasOwnProperty("top-system-distance")) {
						// override the set amount
						runningY = parseInt(measure.systemLayout['top-system-distance']);
					}
				}
				
				// draw the system overlay normally
				var systemMarginWidth:int = pageMarginWidth - renderer.systemMargins.left - renderer.systemMargins.right;
				graphics.beginFill(0x999999, 0.3);
				graphics.drawRect(renderer.evenPageMargins.left + renderer.systemMargins.left + addedLeftMargin, 
					renderer.evenPageMargins.top + runningY, 
					systemMarginWidth - addedLeftMargin - addedRightMargin, 42);
				graphics.endFill();
				
				// increment for the next system
				runningY += renderer.systemDistance + 42;
			}
		}
	}
}