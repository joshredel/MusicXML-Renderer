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

	/**
	 * Classes that implement ParserListener and add themselves as listeners
	 * to a <code>Parser</code> object will receive events when
	 * the <code>Parser</code> inteprets tokens from a Music String.
	 * @see MusicStringParser
	 *
	 *@author David Koelle
	 *@version 3.0
	 */
	public interface ParserListener {
		/**
		 * Called when the parser encounters a voice event.
		 * @param voice the event that has been parsed
		 * @see Voice
		 */
		function voiceEvent(voice:Voice):void;
		
		/**
		 * Called when the parser encounters a tempo event.
		 * @param tempo the event that has been parsed
		 * @see Tempo
		 */
		function tempoEvent(tempo:Tempo):void;
		
		/**
		 * Called when the parser encounters an instrument event.
		 * @param instrument the event that has been parsed
		 * @see Instrument
		 */
		function instrumentEvent(instrument:Instrument):void;
		
		/**
		 * Called when the parser encounters a layer event.
		 * @param layer the event that has been parsed
		 * @see Layer
		 */
		//function layerEvent(layer:Layer):void;
		
		/**
		 * Called when the parser encounters a measure event.
		 * @param measure the event that has been parsed
		 * @see Measure
		 */
		function measureEvent(measure:Measure):void;
		
		function measureEndEvent(measure:Measure):void;
		
		function directionEvent(direction:Direction):void;
		
		/**
		 * Called when the parser encounters a time event.
		 * @param time the event that has been parsed
		 * @see Time
		 */
		//function timeEvent(time:Time):void;
		
		/**
		 * Called when the parser encounters a key signature event.
		 * @param time the event that has been parsed
		 * @see KeySignature
		 */
		function keySignatureEvent(keySig:KeySignature):void;
		
		/**
		 * Called when the parser encounters a controller event.
		 * @param controller the event that has been parsed
		 */
		//function controllerEvent(controller:Controller):void;
		
		/**
		 * Called when the parser encounters a channel pressure event.
		 * @param channelPressure the event that has been parsed
		 * @see ChannelPressure
		 */
		//function channelPressureEvent(channelPressure:ChannelPressure):void;
		
		/**
		 * Called when the parser encounters a polyphonic pressure event.
		 * @param polyphonicPressure the event that has been parsed
		 * @see PolyphonicPressure
		 */
		//function polyphonicPressureEvent(polyphonicPressure:PolyphonicPressure):void;
		
		/**
		 * Called when the parser encounters a pitch bend event.
		 * @param pitchBend the event that has been parsed
		 * @see PitchBend
		 */
		//function pitchBendEvent(pitchBend:PitchBend):void;
		
		/**
		 * Called when the parser encounters an initial note event.
		 * @param note the event that has been parsed
		 * @see Note
		 */
		function noteEvent(note:Note):void;
		
		/**
		 * Called when the parser encounters a sequential note event.
		 * @param note the event that has been parsed
		 * @see Note
		 */
		function sequentialNoteEvent(note:Note):void;
		
		/**
		 * Called when the parser encounters a parallel note event.
		 * @param note the event that has been parsed
		 * @see Note
		 */
		function parallelNoteEvent(note:Note):void;
	}
}