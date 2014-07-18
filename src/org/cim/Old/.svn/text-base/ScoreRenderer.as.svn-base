package org.cim.old {
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.core.UIComponent;
	import mx.events.CollectionEvent;
	
	import spark.components.Button;
	import spark.components.Label;
	import spark.core.IViewport;
	
	[Event(name="scoreReady",type="flash.events.Event")]
	
	/**
	 * Renders a musical score on screen.
	 * Reads from events triggered by a MusicXMLParser.
	 */
	public final class ScoreRenderer extends UIComponent implements ParserListener {
		/**
		 * Defines the score ready constant used in the event
		 * when the score has been preapared and we're ready to parse.
		 */
		public static const SCORE_READY:String = "scoreReady";
		
		/*********************************************************
		 * The MusicXML that describes the music we're playing.
		 * Used here to gather the "defaults" section to use 
		 * for rendering.
		 *********************************************************/
		public var musicXML:XML;
		public var pageWidth:Number;
		public var pageHeight:Number;
		public var oddPageMargins:Margins;
		public var evenPageMargins:Margins;
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
		 * The current measure we are filling with notes.
		 */
		private var currentMeasure:Measure;
		
		/**
		 * The pages we have
		 */
		private var pages:Array;
		
		/**
		 * Whether we are draying an overlay or an actual score.
		 * True is a real score,f alse is an overlay
		 */
		private var trueRender:Boolean;
		
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
						var margins:XMLList = pageLayout['page-margins'].(@type == "odd");
						
						oddPageMargins = new Margins();
						oddPageMargins.top = margins['top-margin'];
						oddPageMargins.bottom = margins['bottom-margin'];
						oddPageMargins.left = margins['left-margin'];
						oddPageMargins.right = margins['right-margin'];
						
						margins = pageLayout['page-margins'].(@type == "even");
						
						evenPageMargins = new Margins();
						evenPageMargins.top = margins['top-margin'];
						evenPageMargins.bottom = margins['bottom-margin'];
						evenPageMargins.left = margins['left-margin'];
						evenPageMargins.right = margins['right-margin'];
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
				
				// get appearance
				if(defaults.hasOwnProperty("appearance")) {
					var appearance:XMLList = defaults.appearance;
					
					lineWidths = new Dictionary();
					for each(var lineWidth:XML in XMLList(appearance['line-width'])) {
						lineWidths[String(lineWidth.@type)] = Number(lineWidth);
					}
					
					noteSizes = new Dictionary();
					for each(var noteSize:XML in XMLList(appearance['note-size'])) {
						noteSizes[String(noteSize.@type)] = Number(noteSize);
					}
				}
			}
			
			// store our rendering style
			this.trueRender = trueRender;
			pages = new Array();
			
			// ok, we have all information, we can start the actual drawing
			// prepare for receiving events
			renderQueue = new ArrayCollection();
			processing = false;
			renderQueue.addEventListener(CollectionEvent.COLLECTION_CHANGE, checkForProcessingQueue);
			
			// notify that we are complete
			this.dispatchEvent(new Event(ScoreRenderer.SCORE_READY));
			
		}
		
		/**
		 * Checks to make sure that we are processing the renderQueue.
		 * If we are not, then start doing so.
		 */
		private function checkForProcessingQueue(event:CollectionEvent):void {
			if(!processing) {
				processQueue();
			}
		}
		
		/**
		 * Processes the queue by rendering each of the items in the queue at this point in time.
		 */
		private function processQueue():void {
			// lock the process
			processing = true;
			
			// render each item in the queue
			while(renderQueue.length > 0) {
				var item:* = renderQueue.removeItemAt(renderQueue.length - 1);
				
				if(trueRender) {
					processScoreItem(item);
				} else {
					processOverlayItem(item);
				}
			}
			
			// release the process
			processing = false;
		}
		
		/**
		 * Processes a traditional score item for drawing.
		 */
		private function processScoreItem(item:*):void {
			if(item is Measure) {
				var measure:Measure = item as Measure;
				if(measure.number > 0) {
					// it's a start of a measure
					// set this as the current measure
					var lastMeasure:Measure = currentMeasure;
					currentMeasure = measure;
					
					// pass on clef and staff
					if(lastMeasure && currentMeasure.clefs.length == 0) {
						currentMeasure.clefs = lastMeasure.clefs;
						currentMeasure.staffCount = lastMeasure.staffCount;
					}
					
					// update where it should go
					if(currentMeasure.newSystem || currentMeasure.newPage) {
						// start a new line!
						runningX = 0;
						if(lastMeasure) {
							runningY += lastMeasure.finishedHeight + this.systemDistance;
						} else {
							runningY = this.topSystemDistance;
						}
					}
					
					// add it
					this.addChild(measure);
					
					// actually position it
					measure.x = runningX;
					measure.y = runningY;
				} else {
					// it's the end of a measure
					// ask the current measure to draw itself
					currentMeasure.draw(this.staffDistance);
					
					// increment the running x and y
					runningX += currentMeasure.finishedWidth;
					this.height += currentMeasure.finishedHeight;
				}
			} else if(item is Note) {
				// it's a note, add it to the current measure
				if(currentMeasure) {
					currentMeasure.notes.push(item);
				}
			}
		}
		
		/**
		 * Processes items for drawing in an overlay.
		 */
		private function processOverlayItem(item:*):void {
			if(item is Measure) {
				var measure:Measure = item as Measure;
				if(measure.number > 0) {
					// if it's measure 1, start a new page and system automatically
					if(measure.number == 1) {
						currentPage = new Page(this);
						pages.push(currentPage);
						
						currentSystem = new System();
						currentPage.systems.push(currentSystem);
					}
					
					// it's a start of a measure
					// set this as the current measure
					var lastMeasure:Measure = currentMeasure;
					currentMeasure = measure;
					
					// pass on clef and staff
					if(lastMeasure && currentMeasure.clefs.length == 0) {
						currentMeasure.clefs = lastMeasure.clefs;
						currentMeasure.staffCount = lastMeasure.staffCount;
					}
					
					// create a new page if we hit it
					if(currentMeasure.newPage) {
						// draw the page first!
						this.addChild(currentPage);
						currentPage.x = 0;
						currentPage.y = runningY;
						currentPage.draw();
						
						// increment the x
						runningY += pageHeight + 40
						
						// now get a new one
						currentPage = new Page(this);
						pages.push(currentPage);
					}
					
					// create a new system if we hit it
					if(currentMeasure.newSystem) {
						currentSystem = new System();
						currentPage.systems.push(currentSystem);
					}
					
					// add it
					currentSystem.measures.push(measure);
				}
			}
		}
		
		/************************************************
		 * Listeners for events fired from the parser.
		 ************************************************/
		public function voiceEvent(voice:Voice):void {
			trace("voiceEvent");
			renderQueue.addItem(voice);
		}
		
		public function tempoEvent(tempo:Tempo):void {
			trace("tempoEvent");
			renderQueue.addItem(tempo);
		}
		
		public function instrumentEvent(instrument:Instrument):void {
			trace("instrumentEvent");
			renderQueue.addItem(instrument);
		}
		
		public function measureEvent(measure:Measure):void {
			trace("measureEvent");
			renderQueue.addItem(measure);
		}
		
		public function measureEndEvent(measure:Measure):void {
			trace("measureEndEvent");
			renderQueue.addItem(measure);
		}
		
		public function directionEvent(direction:Direction):void {
			trace("directionEvent");
			renderQueue.addItem(direction);
		}
		
		public function keySignatureEvent(keySig:KeySignature):void {
			trace("keySignatureEvent");
			renderQueue.addItem(keySig);
		}
		
		public function noteEvent(note:Note):void {
			trace("noteEvent");
			renderQueue.addItem(note);
		}
		
		public function sequentialNoteEvent(note:Note):void {
			trace("sequentialNoteEvent");
			renderQueue.addItem(note);
		}
		
		public function parallelNoteEvent(note:Note):void {
			trace("parallelNoteEvent");
			renderQueue.addItem(note);
		}
	}
}