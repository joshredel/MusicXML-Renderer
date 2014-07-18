/*
* JFugue - API for Music Programming
* Copyright (C) 2003-2008  David Koelle
*
* http://www.jfugue.org 
* 
* This library is free software; you can redistribute it and/or
* modify it under the terms of the GNU Lesser General Public
* License as published by the Free Software Foundation; either
* version 2.1 of the License, or any later version.
* 
* This library is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* Lesser General Public License for more details.
* 
* You should have received a copy of the GNU Lesser General Public
* License along with this library; if not, write to the Free Software
* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
*  
*/

package org.cim.old {
	import mx.collections.ArrayCollection;
	
	import org.cim.old.ParserListener;
	
	public class Parser {
		public function Parser() {
			progressListenerList = new ArrayCollection();
			listenerList = new ArrayCollection();
		}
		
		// Logging methods
		///////////////////////////////////////////
		
		/**
		 * Pass this value to setTracing( ) to turn tracing off.  Tracing is off by default.
		 */
		public static const TRACING_OFF:int= 0;
		
		/**
		 * Pass this value to setTracing( ) to turn tracing on.  Tracing is off by default.
		 */
		public static const TRACING_ON:int= 1;
		
		/**
		 * Turns tracing on or off.  If you're having trouble with your music string,
		 * or if you've added new tokens to the parser, turn tracing on to make sure
		 * that your new tokens are parsed correctly.
		 */
		public var tracing:int = TRACING_OFF;
		
		/**
		 * Displays the passed String.
		 * @param s the String to display
		 */
		protected function tracer(...sentenceFragments:Array):void {
			if(this.tracing == TRACING_ON) {
				var buddy:StringBuffer= new StringBuffer();
				for (var i:int = 0; i < sentenceFragments.length; i++) {
					buddy.append(sentenceFragments[i]);
				}
				
				trace(buddy.toString());
			}
		}
		
		//
		// ParserProgressListener methods
		/////////////////////////////////////////////////////////////////////////
		
		/**
		 * List of ParserProgressListeners
		 */
		protected var progressListenerList:ArrayCollection;
		
		/**
		 * Adds a <code>ParserListener</code>.  The listener will receive events when the parser
		 * interprets music string tokens.
		 *
		 * @param listener the listener that is to be notified of parser events
		 */
		public function addParserProgressListener(l:ParserProgressListener):void {
			progressListenerList.addItem(l);
		}
		
		/**
		 * Removes a <code>ParserListener</code>.
		 *
		 * @param listener the listener to remove
		 */
		public function removeParserProgressListener(l:ParserProgressListener):void {
			progressListenerList.removeItemAt(progressListenerList.getItemIndex(l));
		}
		
		protected function clearParserProgressListeners():void {
			progressListenerList.removeAll();
		}
		
		/**
		 * Tells all ParserProgressListener interfaces that progress has occured.
		 */
		protected function fireProgressReported(description:String, partComplete:Number, whole:Number):void {
			var listeners:Array = progressListenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserProgressListener(listeners[i])).progressReported(description, partComplete, whole);
			}
		}
		
		//
		// ParserListener methods
		/////////////////////////////////////////////////////////////////////////
		
		/**
		 * List of ParserListeners
		 */
		protected var listenerList:ArrayCollection;
		
		/**
		 * Adds a <code>ParserListener</code>.  The listener will receive events when the parser
		 * interprets music string tokens.
		 *
		 * @param listener the listener that is to be notified of parser events
		 */
		public function addParserListener(l:ParserListener):void {
			listenerList.addItem(l);
		}
		
		/**
		 * Removes a <code>ParserListener</code>.
		 *
		 * @param listener the listener to remove
		 */
		public function removeParserListener(l:ParserListener):void {
			listenerList.removeItemAt(listenerList.getItemIndex(l));
		}
		
		protected function clearParserListener():void {
			listenerList.removeAll();
		}
		
		/**
		 * Tells all ParserListeners that a voice event has been parsed.
		 */
		protected function fireVoiceEvent(event:Voice):void {
			var listeners:Array = listenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserListener(listeners[i])).voiceEvent(event);
			}
		}
		
		/**
		 * Tells all ParserListeners that a tempo event has been parsed.
		 */
		protected function fireTempoEvent(event:Tempo):void {
			var listeners:Array = listenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserListener(listeners[i])).tempoEvent(event);
			}
		}
		
		/**
		 * Tells all ParserListeners that an instrument event has been parsed.
		 */
		protected function fireInstrumentEvent(event:Instrument):void {
			var listeners:Array = listenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserListener(listeners[i])).instrumentEvent(event);
			}
		}
		
		/**
		 * Tells all ParserListeners that a layer event has been parsed.
		 */
		/*protected function fireLayerEvent(event:Layer):void {
			var listeners:Array = listenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserListener(listeners[i])).layerEvent(event);
			}
		}*/
		
		/**
		 * Tells all ParserListeners that a time event has been parsed.
		 */
		/*protected function fireTimeEvent(event:Time):void {
			var listeners:Array = listenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserListener(listeners[i])).timeEvent(event);
			}
		}*/
		
		/**
		 * Tells all ParserListeners that a key signature event has been parsed.
		 */
		protected function fireKeySignatureEvent(event:KeySignature):void {
			var listeners:Array = listenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserListener(listeners[i])).keySignatureEvent(event);
			}
		}
		
		/**
		 * Tells all ParserListeners that a measure event has been parsed.
		 */
		protected function fireMeasureEvent(event:Measure):void {
			var listeners:Array = listenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserListener(listeners[i])).measureEvent(event);
			}
		}
		
		/**
		 * Tells all ParserListeners that a measure end event has been parsed.
		 */
		protected function fireMeasureEndEvent(event:Measure):void {
			var listeners:Array = listenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserListener(listeners[i])).measureEndEvent(event);
			}
		}
		
		/**
		 * Tells all ParserListeners that a direction event has been parsed.
		 */
		protected function fireDirectionEvent(event:Direction):void {
			var listeners:Array = listenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserListener(listeners[i])).directionEvent(event);
			}
		}
		
		/**
		 * Tells all ParserListeners that a constroller event has been parsed.
		 */
		/*protected function fireControllerEvent(event:Controller):void {
			var listeners:Array = listenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserListener(listeners[i])).controllerEvent(event);
			}
		}*/
		
		/**
		 * Tells all ParserListeners that a channel pressure event has been parsed.
		 */
		/*protected function fireChannelPressureEvent(event:ChannelPressure):void {
			var listeners:Array = listenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserListener(listeners[i])).channelPressureEvent(event);
			}
		}*/
		
		/**
		 * Tells all ParserListeners that a polyphonic pressure event has been parsed.
		 */
		/*protected function firePolyphonicPressureEvent(event:PolyphonicPressure):void {
			var listeners:Array = listenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserListener(listeners[i])).polyphonicPressureEvent(event);
			}
		}*/
		
		/**
		 * Tells all ParserListeners that a pitch bend event has been parsed.
		 */
		/*protected function firePitchBendEvent(event:PitchBend):void {
			var listeners:Array = listenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserListener(listeners[i])).pitchBendEvent(event);
			}
		}*/
		
		/**
		 * Tells all ParserListeners that a note event has been parsed.
		 */
		protected function fireNoteEvent(event:Note):void {
			var listeners:Array = listenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserListener(listeners[i])).noteEvent(event);
			}
		}
		
		/**
		 * Tells all ParserListeners that a sequential note event has been parsed.
		 */
		protected function fireSequentialNoteEvent(event:Note):void {
			var listeners:Array = listenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserListener(listeners[i])).sequentialNoteEvent(event);
			}
		}
		
		/**
		 * Tells all ParserListeners that a parallel note event has been parsed.
		 */
		protected function fireParallelEvent(event:Note):void {
			var listeners:Array = listenerList.toArray();
			for(var i:int = listeners.length - 1; i >= 0; i--) {
				(ParserListener(listeners[i])).parallelNoteEvent(event);
			}
		}
	}
}