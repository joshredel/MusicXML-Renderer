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
	import flash.utils.Dictionary;
	
	import spark.components.Label;

	/**
	 * A Note stores all information necessary to render it to screen.
	 * It conveys information from the parsed XML to the renderer.
	 * A Note can also be added the screen and drawn as it is 
	 * a label.
	 */
	public final class Note extends Label {
		/**
		 * The MIDI note value.
		 * Not used in OpenOrchestra.
		 */
		public var value:uint = 0;
		
		/**
		 * The duration of the note.
		 * Not used in OpenOrchestra.
		 */
		public var duration:Number = 0;
		
		/**
		 * The decimal duration of the note.
		 * Not used in OpenOrchestra.
		 */
		public var decimalDuration:Number = 0.0;
		
		/**
		 * Whether or not this note is the start of a tie.
		 */
		public var isStartOfTie:Boolean = false;
		
		/**
		 * Whether or not this note ends a tie.
		 */
		public var isEndOfTie:Boolean = false;
		
		/**
		 * The volume of the note when it is first played.
		 * Not used in OpenOrchestra.
		 */
		public var attackVelocity:uint = DEFAULT_VELOCITY;
		
		/**
		 * The volume of the note when it is finished playing.
		 * Not used in OpenOrchestra.
		 */
		public var decayVelocity:uint = DEFAULT_VELOCITY;
		
		/**
		 * Whether or not the note is a rest.
		 */
		public var isRest:Boolean = false;
		
		/**
		 * The type of note expressed as a word.
		 */
		public var type:String;
		public static const WHOLE:String = "whole";
		public static const HALF:String = "half";
		public static const QUARTER:String = "quarter";
		public static const EIGHTH:String = "eighth";
		public static const SIXTEENTH:String = "sixteenth";
		
		/**
		 * Whether or not the note has accompanying notes, i.e. 
		 * notes that are part of a chord or are played at 
		 * the same time.
		 * Not used in OpenOrchestra.
		 */
		public var accompanyingNotes:Boolean = false;
		
		/**
		 * The pitch of the note as a Pitch object.
		 */
		public var pitch:Pitch;
		
		/**
		 * Whether or not the note is part of a chord.
		 */
		public var isChord:Boolean = false;
		
		/**
		 * The staff the note is placed on.
		 */
		public var staffNumber:int = 1;
		
		/********************
		 * Unicode Mapping
		 ********************/
		/**
		 * A dictionary mapping the note's type to a unicode representation
		 * used when drawing the note on scren.  This is for non-rest notes.
		 */
		public static const unicodeNoteDictionary:Dictionary = new Dictionary();
		unicodeNoteDictionary[Note.WHOLE] = 0xF077;
		unicodeNoteDictionary[Note.HALF] = 0xF068;
		unicodeNoteDictionary[Note.QUARTER] = 0xF071;
		unicodeNoteDictionary[Note.EIGHTH] = 0xF065;
		unicodeNoteDictionary[Note.SIXTEENTH] = 0xF078;
		
		/**
		 * A dictionary mapping the note's type to a unicode representation
		 * used when drawing the note on scren.  This is for rest notes.
		 */
		public static const unicodeRestDictionary:Dictionary = new Dictionary();
		unicodeRestDictionary[Note.WHOLE] = 0xF0B7;
		unicodeRestDictionary[Note.HALF] = 0xF0B7;
		unicodeRestDictionary[Note.QUARTER] = 0xF0CE;
		unicodeRestDictionary[Note.EIGHTH] = 0xF0E4;
		unicodeRestDictionary[Note.SIXTEENTH] = 0xF0C5;
		
		/**
		 * Indicates that this note is the first note in the token.
		 */
		public static const FIRST:uint= 0;
		
		/**
		 * Indicates that this note immediately follows a previous note in the same token.
		 */
		public static const SEQUENTIAL:uint= 1;
		
		/**
		 * Indicates that this note is played at the same time as a previous note in the same token.
		 */
		public static const PARALLEL:uint= 2;
		
		/**
		 * Default value for attack and decay velocity.
		 */
		public static const DEFAULT_VELOCITY:uint= 64;
		
		/**
		 * Returns the frequency, in Hertz, for the given note value.
		 * For example, the frequency for A5 (MIDI note 69) is 440.0
		 * @param noteValue
		 * @return
		 */
		public static function getFrequencyForNote(noteValue:int):Number {
			var freq:Number = 0;
			var freq0:Number = 8.1757989156;
			for(var d:Number = 0; d <= noteValue; d++) {
				freq = freq0 * Math.pow(2, d / 12);
			}
			
			// truncate to 4 sig figs
			var retVal:Number = Math.round(freq * 10000) / 10000;
			return retVal;
		}
		
		/**
		 * Draws this note as described.
		 */
		public function draw(ignoreTail:Boolean = false):void {
			// get the note from the font
			var noteString:String;
			if(this.isRest) {
				noteString = String.fromCharCode(unicodeRestDictionary[this.type]);
			} else {
				// if requested, ignore the tail (on eigth or sixteenth notes)
				if(ignoreTail) {
					// draw a quarter so the tail doesn't show
					noteString = String.fromCharCode(unicodeNoteDictionary[Note.QUARTER]);
				} else {
					// keep it's form!
					noteString = String.fromCharCode(unicodeNoteDictionary[this.type]);
				}
			}
			
			// stylize the note!
			this.setStyle("fontSize", 30);
			this.setStyle("fontFamily", "opusFont");
			this.setStyle("verticalAlign", "bottom");
			this.text = noteString;
			//this.width = text.measureText(clef).height;
			//this.height = text.measureText(clef).height;
			this.width = 24;
			this.height = 50;
		}
		
		/**
		 * An array of all possible notes.
		 */
		public static const NOTES:Array= new Array("C", "C#", "D", "Eb", "E", "F", "F#", "G", "G#", "A", "Bb", "B");
		
		/****************
		 * Instruments
		 ****************/
		public static const ACOUSTIC_BASS_DRUM:uint= 35;
		public static const BASS_DRUM:uint= 36;
		public static const SIDE_STICK:uint= 37;
		public static const ACOUSTIC_SNARE:uint= 38;
		public static const HAND_CLAP:uint= 39;
		
		public static const ELECTRIC_SNARE:uint= 40;
		public static const LOW_FLOOR_TOM:uint= 41;
		public static const CLOSED_HI_HAT:uint= 42;
		public static const HIGH_FLOOR_TOM:uint= 43;
		public static const PEDAL_HI_HAT:uint= 44;
		public static const LOW_TOM:uint= 45;
		public static const OPEN_HI_HAT:uint= 46;
		public static const LOW_MID_TOM:uint= 47;
		public static const HI_MID_TOM:uint= 48;
		public static const CRASH_CYMBAL_1:uint= 49;
		
		public static const HIGH_TOM:uint= 50;
		public static const RIDE_CYMBAL_1:uint= 51;
		public static const CHINESE_CYMBAL:uint= 52;
		public static const RIDE_BELL:uint= 53;
		public static const TAMBOURINE:uint= 54;
		public static const SPLASH_CYMBAL:uint= 55;
		public static const COWBELL:uint= 56;
		public static const CRASH_CYMBAL_2:uint= 57;
		public static const VIBRASLAP:uint= 58;
		public static const RIDE_CYMBAL_2:uint= 59;
		
		public static const HI_BONGO:uint= 60;
		public static const LOW_BONGO:uint= 61;
		public static const MUTE_HI_CONGA:uint= 62;
		public static const OPEN_HI_CONGA:uint= 63;
		public static const LOW_CONGA:uint= 64;
		public static const HIGH_TIMBALE:uint= 65;
		public static const LOW_TIMBALE:uint= 66;
		public static const HIGH_AGOGO:uint= 67;
		public static const LOW_AGOGO:uint= 68;
		public static const CABASA:uint= 69;
		
		public static const MARACAS:uint= 70;
		public static const SHORT_WHISTLE:uint= 71;
		public static const LONG_WHISTLE:uint= 72;
		public static const SHORT_GUIRO:uint= 73;
		public static const LONG_GUIRO:uint= 74;
		public static const CLAVES:uint= 75;
		public static const HI_WOOD_BLOCK:uint= 76;
		public static const LOW_WOOD_BLOCK:uint= 77;
		public static const MUTE_CUICA:uint= 78;
		public static const OPEN_CUICA:uint= 79;
		
		public static const MUTE_TRIANGLE:uint= 80;
		public static const OPEN_TRIANGLE:uint= 81;
	}
}