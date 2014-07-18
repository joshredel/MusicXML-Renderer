package org.cim {
	import flash.display.Sprite;
	
	import mx.controls.Alert;
	import mx.controls.Image;
	import mx.controls.Label;
	import mx.core.UIComponent;
	
	/**
	 * A page holds a collection of systems.  It is responsible for
	 * rendering the score from a file and for positioning the systems appropriately.
	 */
	public class Page extends UIComponent {
		/**
		 * The systems that are part of this page.
		 */
		public var systems:Array = new Array();
		
		/**
		 * The renderer drawing this page.
		 */
		public var renderer:OverlayRenderer;
		
		/**
		 * The page number for this page.
		 */
		public var pageNumber:int;
		
		/**
		 * The height of a measure.
		 */
		private const MEASURE_HEIGHT:Number = 40;
		
		/**
		 * Constructor
		 */
		public function Page(renderer:OverlayRenderer, pageNumber:int):void {
			this.renderer = renderer;
			this.pageNumber = pageNumber;
		}
		
		/**
		 * Draws the overlay for this page based on its elements.
		 */
		public function draw():void {
			// draw the image of the sheet music as a background
			var sheet:Image = new Image();
			sheet.source = "file:///C:/Users/oo/Documents/OpenOrchestra/OpenOrchestra PHP/sheetmusic/MarthasVineyard_Trumpet1_p" + pageNumber + ".png";
			sheet.width = renderer.pageWidth;
			sheet.height = renderer.pageHeight;
			sheet.smoothBitmapContent = true;
			this.addChild(sheet);
			
			// create a sprite to draw everything in
			var overlay:Sprite = new Sprite();
			this.addChild(overlay);
			
			// draw the page
			overlay.graphics.beginFill(0x999999, 0.3)
			overlay.graphics.drawRect(0, 0, renderer.pageWidth, renderer.pageHeight);
			overlay.graphics.endFill();
			
			// draw the margins
			var pageMarginWidth:int = renderer.pageWidth - renderer.pageMargins.left - renderer.pageMargins.right;
			var pageMarginHeight:int = renderer.pageHeight - renderer.pageMargins.top - renderer.pageMargins.bottom;
			overlay.graphics.beginFill(0x999999, 0.3)
			overlay.graphics.drawRect(renderer.pageMargins.left, renderer.pageMargins.top, 
							  pageMarginWidth, pageMarginHeight);
			overlay.graphics.endFill();
			
			// draw the systems and their measures
			var runningY:int = renderer.topSystemDistance;
			
			for(var i:int = 0; i < systems.length; i++) {
				// check if there is a special layout for this system
				var firstMeasure:Measure = systems[i].measures[0] as Measure;
				var addedLeftMargin:int = 0;
				var addedRightMargin:int = 0;
				if(firstMeasure.systemLayout) {
					// there is a special layout addition to the standard amounts
					if(firstMeasure.systemLayout.hasOwnProperty("system-margins")) {
						// check for left margins
						if(firstMeasure.systemLayout['system-margins'].hasOwnProperty("left-margin")) {
							addedLeftMargin = firstMeasure.systemLayout['system-margins']['left-margin'];
						}
						
						// check for right margins
						if(firstMeasure.systemLayout['system-margins'].hasOwnProperty("right-margin")) {
							addedRightMargin = firstMeasure.systemLayout['system-margins']['right-margin'];
						}
					}
					
					// check for a different top system distance (it's the top system
					if(firstMeasure.systemLayout.hasOwnProperty("top-system-distance")) {
						// override the set amount
						runningY = parseInt(firstMeasure.systemLayout['top-system-distance']);
					} else {
						// we're not the first measure on the page, but the first in another system
						if(firstMeasure.systemLayout && firstMeasure.systemLayout.hasOwnProperty("system-distance")) {
							runningY += parseInt(firstMeasure.systemLayout['system-distance']) + MEASURE_HEIGHT;
						} else {
							runningY += renderer.systemDistance + MEASURE_HEIGHT;
						}
					}
				}
				
				// draw the system overlay normally
				var systemMarginWidth:int = pageMarginWidth - renderer.systemMargins.left - renderer.systemMargins.right;
				overlay.graphics.beginFill(0x999999, 0.3);
				overlay.graphics.drawRect(renderer.pageMargins.left + renderer.systemMargins.left + addedLeftMargin, 
					renderer.pageMargins.top + runningY, 
					systemMarginWidth - addedLeftMargin - addedRightMargin, MEASURE_HEIGHT);
				overlay.graphics.endFill();
				
				// draw the measures in this system
				var runningX:int = renderer.pageMargins.left + renderer.systemMargins.left + addedLeftMargin;
				for each(var measure:Measure in systems[i].measures) {
					// draw the number
					var label:Label = new Label();
					this.addChild(label);
					label.text = String(measure.number);
					label.x = runningX;
					label.y = renderer.pageMargins.top + runningY - 30;
					label.setStyle("fontSize", 20);
					label.width = 60;
					label.height = 25;
					
					// draw an overlay
					overlay.graphics.beginFill(0x999999, 0.3);
					overlay.graphics.drawRect(runningX, renderer.pageMargins.top + runningY, measure.measureWidth - 3, MEASURE_HEIGHT);
					overlay.graphics.endFill();
					
					// draw a black line
					overlay.graphics.beginFill(0x000000, 1);
					overlay.graphics.drawRect(runningX + measure.measureWidth - 2, renderer.pageMargins.top + runningY, 2, MEASURE_HEIGHT);
					overlay.graphics.endFill();
					
					runningX += measure.measureWidth;
				}
			}
		}
	}
}