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
* **********************************************************************
* This has been ported from the above to ActionScript.  Dependence on 
* the XOM library has been replaced with the built-in ActionScript XML
* capabilities.
*/

// NOTES:
// //@@WORK - areas to work on
// //@@WATCH - areas that might be the cause of issues

//@@WATCH - sometimes ++x was the original and x++ was used instead
// ...will this make a difference?  it might!

package org.cim.old {
	import flash.errors.IOError;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.Dictionary;
	import flash.xml.XMLDocument;
	
	import mx.utils.StringUtil;
	
	import org.jfugue.JFugueDefinitions;
	import org.jfugue.JFugueException;
	
	/**
	 * Extends the Parser class for reading MusicXML files.
	 * Triggers Parser events when reading through the XML file.
	 */
	public class MusicXMLParser extends Parser {
		private var dictionaryMap:Dictionary;
		private var document:XML;
		private var volumes:Array = new Array("pppppp", "ppppp", "pppp", "ppp", "pp", "p", "mp", 
			"mf", "f", "ff", "fff", "ffff", "fffff", "ffffff");
		public static const DEFAULT_VELOCITY:uint= 64;
		
		//	note difference between maxVolume and minVolume should be divisible by 13
		private var minVelocity:uint = 10;
		private var maxVelocity:uint = 127;
		private var curVelocity:uint = DEFAULT_VELOCITY;
		private var beats:uint;		//	beats per measure
		private var divisions:uint;	//	divisions per beat
		private var curVoice:int;	//	current voice
		private var nextVoice:int;	//	next available voice # for a new voice
		private var voices:Array;
		
		public function MusicXMLParser() {
			dictionaryMap = new Dictionary();
			JFugueDefinitions.populateDictionary(dictionaryMap);
			beats = 1;
			divisions = 1;
			curVoice = -1;
			nextVoice = 0;
			voices = new Array();
		}
		
		/**
		 * Sets the tempo for the current song.  Tempo is measured in "pulses per quarter".
		 * The parser uses this value to convert note durations, which are relative values and
		 * not directly related to time measurements, into actual times.  For example, a whole
		 * note has the same duration as four quarter notes, but neither a whole note nor a
		 * quarter note equates to any real-life time delay until it's multplied by the tempo.
		 *
		 * The default value for Tempo is 120 pulses per quarter.
		 *
		 * @param tempo the tempo for the current song, in pulses per quarter.
		 * 
		 * @default 120
		 */
		protected var tempo:int= 120;
		
		/**
		 * Parses a MusicXML file and fires events to subscribed <code>ParserListener</code>
		 * interfaces.  As the file is parsed, events are sent
		 * to <code>ParserLisener</code> interfaces, which are responsible for doing
		 * something interesting with the music data, such as playing the music,
		 * displaying it as sheet music, or transforming the pattern.
		 *
		 * the input is a XOM Document, which has been built previously
		 */
		public function parse(musicXML:XML):void {
			// setup the xml file
			document = musicXML;
			
			// get the part list and pull out information
			var parts:XMLList = document['part-list'];
			var partHeaders:Array = new Array();
			var p:int;
			for(p = 0; p < parts.length(); p++) {
				partHeaders.push(new XMLpart());
				//@@WATCH perhaps this should be parts[p]... check later!
				parsePartHeader(parts.children()[p], partHeaders[p]);
			}
			
			// get the part and start parsing actual music
			parts = document['part'];
			for(p = 0; p < parts.length(); p++) {
				parsePart(p, parts[p], partHeaders);
			}
		}
		
		/**
		 * Parses a <code>part</code> element in the <code>part-list</code> section
		 * @param part is the <code>part</code> element
		 * @param partHeader is the array of <code>XMLpart</code> classes that stores
		 * the <code>part-list</code> elements
		 */
		private function parsePartHeader(part:XML, partHeader:XMLpart):void {
			// get id and part name
			partHeader.ID = part.@id;
			partHeader.part_name = part['part-name'];
			
			// if there are score-instruments, get them and store them
			var scoreInstruments:XMLList = new XMLList(part['score-instrument']);
			var x:int;
			for(x = 0; x < scoreInstruments.length(); x++) {
				//@@WATCH check here to make sure that toString is giving us what 
				// the rest of the class expects...
				partHeader.score_instruments += scoreInstruments[x].toString();
				if(x < scoreInstruments.length() - 1) {
					partHeader.score_instruments += "~";
				}
			}
			
			// if there are midi-instruments, get them and store them
			var midiInstruments:XMLList = new XMLList(part['midi-instrument']);
			for(x = 0; x < midiInstruments.length(); x++) {
				// get the current midi instrument
				var midi_instrument:XML = midiInstruments[x];
				
				// extract midi channel, if it exists
				var midiChannel:String = midi_instrument['midi-channel'];
				if(midiChannel.length > 0) {
					partHeader.midi_instruments += midiChannel;
					partHeader.midi_instruments += "|";
				}
				
				// extract midi name, if it exists
				var midiInst:String = midi_instrument['midi-name'];
				if(midiInst.length < 1) {
					// there was no name, look for midi-bank
					midiInst = midi_instrument['midi-bank'];
					if(midiInst.length < 1) {
						// there was no midi-bank, look for program
						midiInst = midi_instrument['program'];
					}
				}
				
				// store whatever was actually found
				partHeader.midi_instruments += midiInst;
				if(x < midiInstruments.length() - 1) {
					partHeader.midi_instruments += "~";
				}
			}
		}
		
		/**
		 * Parses a <code>part</code> and fires all the appropriate note events
		 * @param part is the entire <code>part</part>
		 * @param partHeaders is the array of XMLpart classes that contains
		 * instrument info for the <code>part</code>s
		 */
		private function parsePart(p:int, part:XML, partHeaders:Array):void {
			// find the part header that matches the part we're parsing
			for(var x:int = 0; x < partHeaders.length; x++) {
				if(partHeaders[x].ID == part.@id) {
					if(partHeaders[x].midi_instruments.length < 1) {
						parseVoice(p, x);
						parsePartElementInstruments(p, partHeaders[x].part_name);
					} else {
						parsePartElementInstruments(p, partHeaders[x].midi_instruments);
					}
				}
			}
			
			var measures:XMLList = part.measure;
			for(var m:int = 0; m < measures.length(); ++m) {
				var measure:XML = measures[m];
				var newMeasure:Measure = new Measure();
				newMeasure.number = parseInt(measure.@number);
				
				// get the print information
				if(measure.hasOwnProperty("print")) {
					// see if we are to force a new system with this measure
					if(measure.print.@['new-system'] == "yes") {
						newMeasure.newSystem = true;
					}
					
					// see if we are to force a new page with this measure
					if(measure.print.@['new-page'] == "yes") {
						newMeasure.newPage = true;
					}
					
					// get the system layout properties
					if(measure.print.hasOwnProperty("system-layout")) {
						newMeasure.systemLayout = XML(measure.print['system-layout']);
					}
				}
				
				// get attributes
				if(measure.hasOwnProperty("attributes")) {
					var attributes:XMLList = measure.attributes;
					
					// get the key signature
					// default key = Cmaj
					var key:int = 0;
					var scale:int = 0; // 0 = minor, 1 = major
					
					if(attributes.hasOwnProperty("key")) {
						var attr:XMLList = attributes.key;
						key = attr.fifths;
						var mode:String = attr.mode;
						//@@WATCH doesn't the following assignment break what 
						// was defined in a comment next to scale?
						if(mode.toLowerCase() == "major") {
							scale = 0;
						} else if(mode.toLowerCase() == "minor") {
							scale = 1;
						} else {
							throw new JFugueException(JFugueException.KEYSIG_EXC, mode);
						}
					} else {
						scale = 0; // default = major
					}
					
					newMeasure.keySignature = new KeySignature(key, scale);
					// just pass the key signature witht he measure...
					//fireKeySignatureEvent(new KeySignature(key, scale));
					
					// divisions and beats used to calculate duration when note type not present
					if(attributes.divisions && attributes.divisions != "") {
						this.divisions = parseInt(attributes.divisions);
					}
					
					// get the time signature
					if(attributes.hasOwnProperty("time")) {
						var element_time:XMLList = attributes.time;
						var timeSignature:TimeSignature = new TimeSignature();
						timeSignature.symbol = element_time.@symbol;
						
						if(element_time.hasOwnProperty("beats")) {
							this.beats = parseInt(element_time.beats);
							timeSignature.beats = parseInt(element_time.beats);
						}
						
						if(element_time.hasOwnProperty("beat-type")) {
							timeSignature.beatType = parseInt(element_time['beat-type']);
						}
					}
					
					// get the staff count
					if(attributes.hasOwnProperty("staves")) {
						newMeasure.staffCount = parseInt(attributes.staves);
					}
					
					// get the clefs
					if(attributes.hasOwnProperty("clef")) {
						var clefs:Array = new Array();
						
						for each(var clef:XML in XMLList(attributes.clef)) {
							var newClef:Clef = new Clef();
							//@@WORK - we need a better way to determine if there is no clef number 
							// defined... there might actually be people who label a clef 0!
							newClef.staffNumber = parseInt(clef.@number);
							if(newClef.staffNumber == 0) {
								newClef.staffNumber = 1;
							}
							newClef.line = parseInt(clef.line);
							
							var newSign:String = clef.sign;
							newClef.sign = newSign.toUpperCase();
							
							clefs.push(newClef);
						}
						
						newMeasure.clefs = clefs;
					}
				}
				
				// send this message to the parser
				fireMeasureEvent(newMeasure);
				
				// tempo
				// right now we really don't care about this kind of tempo (playback speed... we want for visual)
				/*
				if(measure.hasOwnProperty("direction")) {
					var direction:XMLList = measure.direction;
					if(direction.hasOwnProperty("direction-type")) {
						var directionType:XMLList = direction['direction-type'];
						if(directionType.hasOwnProperty("metronome")) {
							var metronome:XMLList = directionType.metronome;
							var sBeatUnit:String = metronome['beat-unit'];
							if(sBeatUnit.toLowerCase() != "quarter") {
								throw new JFugueException(JFugueException.BEAT_UNIT_MUST_BE_QUARTER, sBeatUnit);
							}
							
							if(metronome.hasOwnProperty("per-minute")) {
								var bpm:Number = Number(metronome['per-minute']);
								this.tempo = BPMtoPPM(bpm);
								fireTempoEvent(new Tempo(this.tempo));
							}
						}
					}
				}
				*/
				
				// notes
				for each(var child:XML in measure.children()) {
					if(child.name() == "note") {
						parseNote(p, child);
					} else if(child.name() == "direction") {
						parseDirection(child);
					}
				}
				
//				var notes:XMLList = measure.note;
//				for(var n:int = 0; n < notes.length(); n++) {
//					parseNote(p, notes[n]);
//				}
				
				fireMeasureEndEvent(new Measure());
			}
		}
		
		/**
		 * Parses a voice and fires a voice element
		 * @param v is the voice number 1 - 16
		 * @throws JFugueException if there is a problem parsing the element
		 */
		private function parseVoice(p:int, v:int):void {
			// XML part ID's are 1-based, JFugue voice numbers are 0-based
			var voiceNumber:int = -1;
			if(voices.length > 0) {
				for(var x:int = 0; x < this.nextVoice; x++) {
					if(p == voices[x].part && v == voices[x].voice) {
						voiceNumber = x;
					}
				}
			}
			
			// if not found, add it to the array
			if(voiceNumber == -1) {
				voiceNumber = nextVoice;
				var newVoice:voiceDef = new voiceDef();
				newVoice.part = p;
				newVoice.voice = v;
				voices.push(newVoice);
				nextVoice++;
			}
			
			if(voiceNumber != this.curVoice) {
				fireVoiceEvent(new Voice(voiceNumber));
			}
		}
		
		/**
		 * Parses a <code>XMLpart.midi_instruments</code> and fires a voice or
		 * instrument events
		 * @param instruments is the <code>XMLpart.midiinstruments</code> string to parse
		 * Can be a list of ~ separated pairs - midi-channel|InstName where InstName 
		 * can be a midi-name, midi-bank, or program Element  
		 */
		private function parsePartElementInstruments(p:int, instruments:String):void {
			// see how many instruments we have
			if(instruments.indexOf("~") > -1) {
				// we have multiple instruments, split them
				var instArray:Array = instruments.split("~");
				
				// just do the first in the array
				var midiArray:Array = instArray[0].split("|");
				if(midiArray.length > 0 && midiArray[0].length > 0) {
					parseVoice(p, parseInt(midiArray[0]) - 1);
				}
				if(midiArray.length != 1) {
					parseInstrument(instruments);
				}
			}
		}
		
		/**
		 * parses <code>inst</code> and fires an Instrument Event
		 * @param inst is a String that represents the instrument.  If it is a numeric
		 * value, it is interpreted as a midi-bank or program.  If it is an instrument
		 * name, it is looked up in the Dictionary as an instrument name.
		 */
		private function parseInstrument(inst:String):void {
			var instrumentNumber:uint;
			try {
				instrumentNumber = parseInt(inst);
			} catch(e:Error) {
				instrumentNumber = getByteFromDictionary(inst);
			}
			trace("Instrument element: inst = " + inst);
			if(instrumentNumber > -1) {
				fireInstrumentEvent(new Instrument(instrumentNumber));
			}
		}
		
		/**
		 * Look up a byte from the dictionary
		 * @param bracketedString the string to look up
		 * @returns the byte value of the definition
		 * @throws JFugueException if there is a problem getting a byte from the dictionary look-up
		 */
		private function getByteFromDictionary(bracketedString:String):uint {
			var definition:String = dictionaryLookup(bracketedString);
			var newbyte:int;
			
			if(definition.length > 0) {
				try {
					newbyte = new int(definition);
				} catch(e:Error) {
					throw new JFugueException(JFugueException.EXPECTED_BYTE, definition, bracketedString);
				}
			} else {
				newbyte = -1;
			}
			
			return newbyte;
		}
		
		/**
		 * Looks up a string's value in the dictionary.  The dictionary is used to
		 * keep memorable names of obscure numbers - for example, the string FLUTE
		 * is set to a value of 73, so when users want to play music with a flute,
		 * they can say "I[Flute]" instead of "I[73]".
		 *
		 * <p>
		 * The Dictionary feature also lets users define constants so that if the
		 * value of something were to change, it only needs to be changed in one
		 * place.  For example, MY_FAVORITE_INSTRUMENT could be set to 73, then you
		 * can say "I[My_Favorite_Instrument]" when you want to play with that
		 * instrument.  If your favorite instrument were ever to change, you only
		 * have to make the change in one place, instead of every place where you
		 * give the Instrument command.
		 * </p>
		 *
		 * @param bracketedString the string to look up in the dictionary
		 * @returns the definition of the string
		 * @throws JFugueException if there is a problem looking up bracketedString
		 */
		private function dictionaryLookup(bracketedString:String):String {
			var indexOfOpeningBracket:int = bracketedString.indexOf("[");
			var indexOfClosingBracket:int = bracketedString.indexOf("]");
			
			var word:String = null;
			if((indexOfOpeningBracket != -1) && (indexOfClosingBracket != -1)) {
				word = bracketedString.substring(indexOfOpeningBracket, indexOfClosingBracket);
			} else {
				// it appears that "bracketedString" wasn't bracketed
				word = bracketedString;
			}
			word = word.toUpperCase();
			
			var definition:String = String(dictionaryMap[word]);
			//@@WATCH make sure dicMap[blah] checks for existense!
			while((definition != null) && (dictionaryMap[definition.toUpperCase()])) {
				definition = String(dictionaryMap[definition.toUpperCase()]);
			}
			
			// if there is no definition for this word, see if the word is actually a number
			if(!definition) {
				var ch:String = "0";
				var isNumber:Boolean = true;
				for(var i:int = 0; i < word.length; i++) {
					ch = word.charAt(i);
					if((isDigit(ch) && (ch != "."))) {
						isNumber = false;
					}
				}
				if(isNumber) {
					trace("Dictionary lookup returning the number " + word);
					return word;
				} else {
					throw new JFugueException(JFugueException.WORD_NOT_DEFINED_EXC, word, bracketedString);
					definition = "";
				}
			}
			
			trace("Word " + word + " is definition " + definition);
			return definition;
		}
		
		/**
		 * Determines if a string is digit.
		 * From: http://vipuljhawar.wordpress.com/2007/08/10/opensource-flex-api-actionscript-api/
		 */
		private function isDigit(value:String):Boolean {
			return isValidCode(value, 48, 57);
		}
		
		/**
		 * The meat of the functions which checks the values.
		 * From: http://vipuljhawar.wordpress.com/2007/08/10/opensource-flex-api-actionscript-api/
		 */
		private function isValidCode(value:String, minCode:Number, maxCode:Number):Boolean {
			if ((value == null) || (StringUtil.trim(value).length < 1)) {
				return false;
			}
			
			for (var i : int=value.length-1;i >= 0; i--) {
				var code : Number = value.charCodeAt(i);
				if ((code < minCode) || (code > maxCode)) {
					return false;
				}
			}
			
			return true;
		}
		
		/**
		 * converts beats per minute (BPM) to pulses per minute (PPM) assuming 240 pulses per second
		 * In MusicXML, BPM can be fractional, so <code>BPMtoPPM</code> takes a float argument
		 * @param bpm
		 * @return
		 */
		public static function BPMtoPPM(bpm:Number):int {
			//	convert BPM to PPM assuming 240 pulses per second
			return new int((60* 240) / bpm);
		}
		
		/**
		 * parses MusicXML note Element
		 * @param note is the note Element to parse
		 */
		private function parseNote(p:int, note:XML):void {
			var newNote:Note = new Note();
			var isRest:Boolean = false;
			var isStartOfTie:Boolean = false;
			var isEndOfTie:Boolean = false;
			var noteNumber:int = 0;
			var octaveNumber:uint = 0;
			var decimalDuration:Number;
			var newPitch:Pitch = new Pitch();
			
			// skip grace notes
			//if(note.grace != "") {
			//	trace("grace!");
			//	return;
			//}
			if(note.hasOwnProperty("voice")) {
				//parseVoice(p, parseInt(note.voice));
			}
			
			if(note.hasOwnProperty("pitch")) {
				var pitch:XMLList = note.pitch;
				var sStep:String = pitch.step;
				
				newPitch.step = sStep;
				
				switch(sStep.charAt(0)) {
					case "C":
						noteNumber = 0;
						break;
					case "D":
						noteNumber = 2;
						break;
					case "E":
						noteNumber = 4;
						break;
					case "F":
						noteNumber = 5;
						break;
					case "G":
						noteNumber = 7;
						break;
					case "A":
						noteNumber = 9;
						break;
					case "B":
						noteNumber = 11;
						break;
				}
				
				if(pitch.hasOwnProperty("alter")) {
					var alter:String = pitch.alter;
					newPitch.alter = parseInt(alter);
					
					noteNumber += parseInt(alter);
					if(noteNumber > 11) {
						noteNumber = 0;
					} else if(noteNumber < 0) {
						noteNumber = 11;
					}
				}
				
				if(pitch.hasOwnProperty("octave")) {
					var octave:String = pitch.octave;
					octaveNumber = parseInt(octave);
					newPitch.octave = parseInt(octave);
				}
				
				// compute the actual note number, based on octave and note
				var intNoteNumber:int = (octaveNumber * 12) + noteNumber;
				if(intNoteNumber > 127) {
					throw new JFugueException(JFugueException.NOTE_OCTAVE_EXC, "", String(intNoteNumber));
				}
				noteNumber = intNoteNumber;
			} else {
				isRest = true;
			}
			
			var element_duration:String = note.duration;
			decimalDuration = (element_duration == "" ? beats * divisions : 
														Number(element_duration) / (beats * divisions));
			
			// tempo is in PPQ (pulses per quarter).  turn that into 
			// "PPW", then multiply that by durationNumber for WHQITXN notes
			var PPW:Number = Number(this.tempo * 4); // 4 quarter notes in a whole note
			var duration:Number = PPW * decimalDuration;
			
			if(note.hasOwnProperty("notations")) {
				var notations:XMLList = note.notations;
				
				// ties
				if(notations.hasOwnProperty("tied")) {
					var tiedType:String = notations.tied.@type;
					if(tiedType.toLowerCase() == "start") {
						isStartOfTie = true;
					} else if(tiedType.toLowerCase() == "end") {
						isEndOfTie = true;
					}
				}
				
				// velocity
				//@@WATCH - the dynamics for us is actually in the
				// directon section, not notations
				//@@WORK - do later... volume doesn't matter right now
				//if(notations.hasOwnProperty("dynamics")) {
				//	var dynamic:
				//}
			}
			
			var attackVelocity:uint = this.curVelocity;
			var decayVelocity:uint = this.curVelocity;
			
			if(note.hasOwnProperty("type")) {
				newNote.type = note.type;
			} else {
				// we can assume it's a whole note if there is no type marked
				newNote.type = Note.WHOLE;
			}
			
			if(note.hasOwnProperty("staff")) {
				newNote.staffNumber = parseInt(note.staff);
			}
			
			// set up the note
			if(isRest) {
				newNote.isRest = true;
				newNote.duration = duration;
				newNote.attackVelocity = 0;
				newNote.decayVelocity = 0;
			} else {
				newNote.value = noteNumber;
				newNote.duration = duration;
				newNote.isStartOfTie = isStartOfTie;
				newNote.isEndOfTie = isEndOfTie;
				newNote.attackVelocity = attackVelocity;
				newNote.decayVelocity = decayVelocity;
				
				newNote.pitch = newPitch;
			}
			
			// ToDo - sequential
//			if(note.hasOwnProperty("chord")) {
//				newNote.type = Note.PARALLEL;
//			} else {
//				newNote.type = Note.FIRST;
//			}
			if(note.hasOwnProperty("chord")) {
				newNote.isChord = true;
			} else {
				newNote.isChord = false;
			}
			
			newNote.decimalDuration = decimalDuration;
			fireNoteEvent(newNote);
		}
		
		/**
		 * Parses MusicXML element Direction
		 */
		private function parseDirection(direction:XML):void {
			var newDirection:Direction = new Direction();
			
			// get the staff it's on
			if(direction.hasOwnProperty("staff")) {
				newDirection.staffNumber = parseInt(direction.staff);
			}
			
			// get the name for now... more later
			if(direction.hasOwnProperty("direction-type")) {
				var directionType:XMLList = direction['direction-type'].children();
				newDirection.name = directionType.name();
			}
			
			// send the direction to the parser!
			fireDirectionEvent(newDirection);
		}
	}
}

//	helper class
class XMLpart extends Object
{	public var ID:String;
	public var part_name:String;
	public var score_instruments:String;
	public var midi_instruments:String;	//	channel1|name1~channel2|name2
	public function XMLpart() {
		ID = "";
		part_name = "";
		score_instruments = "";
		midi_instruments = "";
	}
};

/**
 * voiceDef
 * MusicString voice can be a combination of part and voice
 */
class voiceDef {
	public var part:int;
	public var voice:int;
}