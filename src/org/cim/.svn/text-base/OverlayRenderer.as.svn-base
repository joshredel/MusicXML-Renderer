package org.cim {
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.UIComponent;
	import mx.events.CollectionEvent;
	
	import org.cim.Margins;
	import org.cim.Measure;
	import org.cim.Page;
	import org.cim.System;
	
	import spark.components.Button;
	import spark.components.Label;
	import spark.core.IViewport;
	
	/**
	 * Renders a musical score on screen.
	 * Reads from events triggered by a MusicXMLParser.
	 */
	public final class OverlayRenderer extends UIComponent {
		
		/*********************************************************
		 * The MusicXML that describes the music we're playing.
		 * Used here to gather the "defaults" section to use 
		 * for rendering.
		 *********************************************************/
		public var musicXML:XML;
		public var pageWidth:Number;
		public var pageHeight:Number;
		public var pageMargins:Margins;
		public var systemMargins:Margins;
		public var systemDistance:Number;
		public var topSystemDistance:Number;
		public var staffDistance:Number;
		public var lineWidths:Dictionary;
		public var noteSizes:Dictionary;
		
		/**
		 * The queue we'll use to store parse events as they are fired.
		 * Since they will (most likely) be sent a lot quicker than 
		 * we can render, we need a place to store them temporarily.
		 * It will simply be a queue of the objects, and we will render them in
		 * the order they appear.  
		 */
		private var renderQueue:ArrayCollection;
		
		/**
		 * Whether or not we are currently processing the renderQueue.
		 */
		private var processing:Boolean;
		
		/**
		 * Current x we are drawing at.
		 */
		private var runningX:int;
		
		/**
		 * Current y we are drawing at.
		 */
		private var runningY:int;
		
		/**
		 * The current page we are filling with systems.
		 */
		private var currentPage:Page;
		
		/**
		 * The current system we are filling with measures.
		 */
		private var currentSystem:System;
		
		/**
		 * The pages we have
		 */
		private var pages:Array;
		
		/**
		 * Prepares the score for drawing, based on the defaults data 
		 * in the MusicXML.
		 */
		public function prepareScore(musicXML:XML, trueRender:Boolean = true):void {
			// clear everything out!
			this.graphics.clear();
			for(var i:int = 0; i < this.numChildren; i++) {
				this.removeChildAt(i);
			}
			runningX = 0;
			runningY = 0;
			
			// store the XML
			this.musicXML = musicXML;
			
			// pull out the defaults informatiuon
			if(musicXML.hasOwnProperty("defaults")) {
				var defaults:XMLList = musicXML.defaults;
				
				// get the page layout
				if(defaults.hasOwnProperty("page-layout")) {
					var pageLayout:XMLList = defaults['page-layout'];
					
					// dimensions
					pageWidth = pageLayout['page-width'];
					pageHeight = pageLayout['page-height'];
					
					// margins
					if(pageLayout.hasOwnProperty("page-margins")) {
						var margins:XMLList = pageLayout['page-margins'].(@type == "both");
						
						pageMargins = new Margins();
						pageMargins.top = margins['top-margin'];
						pageMargins.bottom = margins['bottom-margin'];
						pageMargins.left = margins['left-margin'];
						pageMargins.right = margins['right-margin'];
					}
				} 
				
				// get the system layout
				if(defaults.hasOwnProperty("system-layout")) {
					var systemLayout:XMLList = defaults['system-layout'];
					
					systemMargins = new Margins();
					systemMargins.left = systemLayout['system-margins']['left-margin'];
					systemMargins.right = systemLayout['system-margins']['right-margin'];
					
					systemDistance = systemLayout['system-distance'];
					topSystemDistance = systemLayout['top-system-distance'];
				}
				
				// get staff layout
				if(defaults.hasOwnProperty("staff-layout")) {
					staffDistance = defaults['staff-layout']['staff-distance'];
				}
			}
			
			// make a new pages array
			pages = new Array();
			
			// process the measures to create the overlay
			processOverlayItems();
		}
		/**
		 * Parses through the MusicXML to get each measure and draws it
		 * as an overlay over the sheet music.
		 */
		private function processOverlayItems():void {
			// get the measures XMLList
			var partsList:XMLList
			if(musicXML.hasOwnProperty("part")) {
				partsList = musicXML.part;
			} else {
				return;
			}
			
			// running page number
			var pageNumber:int = 1;
			
			// get the measures from the first part
			var measures:XMLList = partsList.measure
			for each(var xmlMeasure:XML in measures) {
				// convert the xml measure into a measure object
				var measure:Measure = convertMeasure(xmlMeasure);
				
				// if it's measure 1, start a new page and a system
				if(measure.number == 1) {
					// new page
					currentPage = new Page(this, pageNumber);
					pages.push(currentPage);
					pageNumber++;
					
					// new system
					currentSystem = new System();
					currentPage.systems.push(currentSystem);
				}
				
				// create a new page if we encounter one
				if(measure.newPage) {
					// draw the current page first
					this.addChild(currentPage);
					currentPage.x = 0;
					currentPage.y = runningY;
					currentPage.draw();
					
					// increment the x
					runningY += pageHeight + 40;
					
					// now create a new page
					currentPage = new Page(this, pageNumber);
					pages.push(currentPage);
					pageNumber++;
				}
				
				//create a new system if we encounter one (a new page also needs a new system)
				if(measure.newSystem || measure.newPage) {
					currentSystem = new System();
					currentPage.systems.push(currentSystem);
				}
				
				// add the measure to the current system
				currentSystem.measures.push(measure);
			}
			
			// finally, draw the current page as it hasn't been drawn yet
			this.addChild(currentPage);
			currentPage.x = 0;
			currentPage.y = runningY;
			currentPage.draw();
		}
		
		/**
		 * Converts an XML representation of a measure into a 
		 * Measure object for easier manipulation.
		 */
		private function convertMeasure(xmlMeasure:XML):Measure {
			// make a new Measure object and populate its fields
			var measure:Measure = new Measure();
			measure.number = xmlMeasure.@number;
			measure.measureWidth = xmlMeasure.@width;
			
			// get the print information
			if(xmlMeasure.hasOwnProperty("print")) {
				// see if we are to force a new system with this measure
				if(xmlMeasure.print.@['new-system'] == "yes") {
					measure.newSystem = true;
				}
				
				// see if we are to force a new page with this measure
				if(xmlMeasure.print.@['new-page'] == "yes") {
					measure.newPage = true;
				}
				
				// get the system layout properties
				if(xmlMeasure.print.hasOwnProperty("system-layout")) {
					measure.systemLayout = XML(xmlMeasure.print['system-layout']);
				}
			}
			
			return measure;
		}
	}
}