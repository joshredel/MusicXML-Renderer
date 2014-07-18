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
	 * The Instrument class stores information about an information as 
	 * parsed from a MusicXML file.  It is used to relay this informatin from 
	 * the parser to the renderer.
	 */
	public final class Instrument {
		/**
		 * The ID of the instrument as used in the XML file.
		 */
		public var instrument:uint;
		
		/**
		 * Creates a new Instrument object, with the specified instrument number.
		 * 
		 * @param instrument the number of the instrument to use
		 */
		public function Instrument(instrument:uint) {
			this.instrument = instrument;
		}
		
		/**
		 * Returns the name of the instrument used in this object
		 * 
		 * @return the name of the instrument used in this object
		 */
		public function getInstrumentName():String {
			return INSTRUMENT_NAME[this.instrument];
		}
		
		/**
		 * An array of all possible (read: supported) instruments.
		 */
		public static const INSTRUMENT_NAME:Array= new Array(
			"Piano",
			"Bright_Acoustic",
			"Electric_Grand",
			"Honkey_Tonk",
			"Electric_Piano",
			"Electric_Piano_2",
			"Harpischord",
			"Clavinet",
			"Celesta",
			"Glockenspiel",
			
			"Music_Box",
			"Vibraphone",
			"Marimba",
			"Xylophone",
			"Tubular_Bells",
			"Dulcimer",
			"Drawbar_Organ",
			"Percussive_Organ",
			"Rock_Organ",
			"Church_Organ",
			
			"Reed_Organ",
			"Accordian",
			"Harmonica",
			"Tango_Accordian",
			"Guitar",
			"Steel_String_Guitar",
			"Electric_Jazz_Guitar",
			"Electric_Clean_Guitar",
			"Electric_muted_Guitar",
			"Overdriven_Guitar",
			"Distortion_Guitar",
			
			"Guitar_Harmonics",
			"Acoustic_Bass",
			"Electric_Bass_Finger",
			"Electric_Bass_Pick",
			"Fretless_Bass",
			"Slap_Bass_1",
			"Slap_Bass_2",
			"Synth_Bass_1",
			"Synth_Bass_2",
			
			"Violin",
			"Viola",
			"Cello",
			"Contrabass",
			"Tremolo_Strings",
			"Pizzicato_Strings",
			"Orchestral_Strings",
			"Timpani",
			"String_Ensemble_1",
			"String_Ensemble_2",
			
			"Synth_strings_1",
			"Synth_strings_2",
			"Choir_Aahs",
			"Voice_Oohs",
			"Synth_Voice",
			"Orchestra_Hit",
			"Trumpet",
			"Trombone",
			"Tuba",
			"Muted_Trumpet",
			
			"French_Horn",
			"Brass_Section",
			"Synth_brass_1",
			"Synth_brass_2",
			"Soprano_Sax",
			"Alto_Sax",
			"Tenor_Sax",
			"Baritone_Sax",
			"Oboe",
			"English_Horn",
			
			"Bassoon",
			"Clarinet",
			"Piccolo",
			"Flute",
			"Recorder",
			"Pan_Flute",
			"Blown_Bottle",
			"Skakuhachi",
			"Whistle",
			"Ocarina",
			
			"Square",
			"Sawtooth",
			"Calliope",
			"Chiff",
			"Charang",
			"Voice",
			"Fifths",
			"Basslead",
			"New_Age",
			"Warm",
			
			"Polysynth",
			"Choir",
			"Bowed",
			"Metallic",
			"Halo",
			"Sweep",
			"Rain",
			"Soundtrack",
			"Crystal",
			"Atmosphere",
			
			"Brightness",
			"Goblins",
			"Echoes",
			"Sci-fi",
			"Sitar",
			"Banjo",
			"Shamisen",
			"Koto",
			"Kalimba",
			"Bagpipe",
			
			"Fiddle",
			"Shanai",
			"Tinkle_Bell",
			"Agogo",
			"Steel_Drums",
			"Woodblock",
			"Taiko_Drum",
			"Melodic_Tom",
			"Synth_Drum",
			"Reverse_Cymbal",
			
			"Guitar_Fret_Noise",
			"Breath_Noise",
			"Seashore",
			"Bird_Tweet",
			"Telephone_Ring",
			"Helicopter",
			"Applause",
			"Gunshot" );
		
		/**
		 * @internal
		 * Mappings of constants and there MIDI 
		 * instrument equivalents.
		 */
		public static const PIANO:uint= 0;
		public static const ACOUSTIC_GRAND:uint= 0;
		public static const BRIGHT_ACOUSTIC:uint= 1;
		public static const ELECTRIC_GRAND:uint= 2;
		public static const HONKEY_TONK:uint= 3;
		public static const ELECTRIC_PIANO:uint= 4;
		public static const ELECTRIC_PIANO_1:uint= 4;
		public static const ELECTRIC_PIANO_2:uint= 5;
		public static const HARPISCHORD:uint= 6;
		public static const CLAVINET:uint= 7;
		public static const CELESTA:uint= 8;
		public static const GLOCKENSPIEL:uint= 9;
		
		public static const MUSIC_BOX:uint= 10;
		public static const VIBRAPHONE:uint= 11;
		public static const MARIMBA:uint= 12;
		public static const XYLOPHONE:uint= 13;
		public static const TUBULAR_BELLS:uint= 14;
		public static const DULCIMER:uint= 15;
		public static const DRAWBAR_ORGAN:uint= 16;
		public static const PERCUSSIVE_ORGAN:uint= 17;
		public static const ROCK_ORGAN:uint= 18;
		public static const CHURCH_ORGAN:uint= 19;
		
		public static const REED_ORGAN:uint= 20;
		public static const ACCORDIAN:uint= 21;
		public static const HARMONICA:uint= 22;
		public static const TANGO_ACCORDIAN:uint= 23;
		public static const GUITAR:uint= 24;
		public static const NYLON_STRING_GUITAR:uint= 24;
		public static const STEEL_STRING_GUITAR:uint= 25;
		public static const ELECTRIC_JAZZ_GUITAR:uint= 26;
		public static const ELECTRIC_CLEAN_GUITAR:uint= 27;
		public static const ELECTRIC_MUTED_GUITAR:uint= 28;
		public static const OVERDRIVEN_GUITAR:uint= 29;
		
		public static const DISTORTION_GUITAR:uint= 30;
		public static const GUITAR_HARMONICS:uint= 31;
		public static const ACOUSTIC_BASS:uint= 32;
		public static const ELECTRIC_BASS_FINGER:uint= 33;
		public static const ELECTRIC_BASS_PICK:uint= 34;
		public static const FRETLESS_BASS:uint= 35;
		public static const SLAP_BASS_1:uint= 36;
		public static const SLAP_BASS_2:uint= 37;
		public static const SYNTH_BASS_1:uint= 38;
		public static const SYNTH_BASS_2:uint= 39;
		
		public static const VIOLIN:uint= 40;
		public static const VIOLA:uint= 41;
		public static const CELLO:uint= 42;
		public static const CONTRABASS:uint= 43;
		public static const TREMOLO_STRINGS:uint= 44;
		public static const PIZZICATO_STRINGS:uint= 45;
		public static const ORCHESTRAL_STRINGS:uint= 46;
		public static const TIMPANI:uint= 47;
		public static const STRING_ENSEMBLE_1:uint= 48;
		public static const STRING_ENSEMBLE_2:uint= 49;
		
		public static const SYNTH_STRINGS_1:uint= 50;
		public static const SYNTH_STRINGS_2:uint= 51;
		public static const CHOIR_AAHS:uint= 52;
		public static const VOICE_OOHS:uint= 53;
		public static const SYNTH_VOICE:uint= 54;
		public static const ORCHESTRA_HIT:uint= 55;
		public static const TRUMPET:uint= 56;
		public static const TROMBONE:uint= 57;
		public static const TUBA:uint= 58;
		public static const MUTED_TRUMPET:uint= 59;
		
		public static const FRENCH_HORN:uint= 60;
		public static const BRASS_SECTION:uint= 61;
		public static const SYNTHBRASS_1:uint= 62;
		public static const SYNTHBRASS_2:uint= 63;
		public static const SOPRANO_SAX:uint= 64;
		public static const ALTO_SAX:uint= 65;
		public static const TENOR_SAX:uint= 66;
		public static const BARITONE_SAX:uint= 67;
		public static const OBOE:uint= 68;
		public static const ENGLISH_HORN:uint= 69;
		
		public static const BASSOON:uint= 70;
		public static const CLARINET:uint= 71;
		public static const PICCOLO:uint= 72;
		public static const FLUTE:uint= 73;
		public static const RECORDER:uint= 74;
		public static const PAN_FLUTE:uint= 75;
		public static const BLOWN_BOTTLE:uint= 76;
		public static const SKAKUHACHI:uint= 77;
		public static const WHISTLE:uint= 78;
		public static const OCARINA:uint= 79;
		
		public static const LEAD_SQUARE:uint= 80;
		public static const SQUARE:uint= 80;
		public static const LEAD_SAWTOOTH:uint= 81;
		public static const SAWTOOTH:uint= 81;
		public static const LEAD_CALLIOPE:uint= 82;
		public static const CALLIOPE:uint= 82;
		public static const LEAD_CHIFF:uint= 83;
		public static const CHIFF:uint= 83;
		public static const LEAD_CHARANG:uint= 84;
		public static const CHARANG:uint= 84;
		public static const LEAD_VOICE:uint= 85;
		public static const VOICE:uint= 85;
		public static const LEAD_FIFTHS:uint= 86;
		public static const FIFTHS:uint= 86;
		public static const LEAD_BASSLEAD:uint= 87;
		public static const BASSLEAD:uint= 87;
		public static const PAD_NEW_AGE:uint= 88;
		public static const NEW_AGE:uint= 88;
		public static const PAD_WARM:uint= 89;
		public static const WARM:uint= 89;
		
		public static const PAD_POLYSYNTH:uint= 90;
		public static const POLYSYNTH:uint= 90;
		public static const PAD_CHOIR:uint= 91;
		public static const CHOIR:uint= 91;
		public static const PAD_BOWED:uint= 92;
		public static const BOWED:uint= 92;
		public static const PAD_METALLIC:uint= 93;
		public static const METALLIC:uint= 93;
		public static const PAD_HALO:uint= 94;
		public static const HALO:uint= 94;
		public static const PAD_SWEEP:uint= 95;
		public static const SWEEP:uint= 95;
		public static const FX_RAIN:uint= 96;
		public static const RAIN:uint= 96;
		public static const FX_SOUNDTRACK:uint= 97;
		public static const SOUNDTRACK:uint= 97;
		public static const FX_CRYSTAL:uint= 98;
		public static const CRYSTAL:uint= 98;
		public static const FX_ATMOSPHERE:uint= 99;
		public static const ATMOSPHERE:uint= 99;
		
		public static const FX_BRIGHTNESS:uint= 100;
		public static const BRIGHTNESS:uint= 100;
		public static const FX_GOBLINS:uint= 101;
		public static const GOBLINS:uint= 101;
		public static const FX_ECHOES:uint= 102;
		public static const ECHOES:uint= 102;
		public static const FX_SCI:uint= 103;
		public static const SCI:uint= 103;
		public static const SITAR:uint= 104;
		public static const BANJO:uint= 105;
		public static const SHAMISEN:uint= 106;
		public static const KOTO:uint= 107;
		public static const KALIMBA:uint= 108;
		public static const BAGPIPE:uint= 109;
		
		public static const FIDDLE:uint= 110;
		public static const SHANAI:uint= 111;
		public static const TINKLE_BELL:uint= 112;
		public static const AGOGO:uint= 113;
		public static const STEEL_DRUMS:uint= 114;
		public static const WOODBLOCK:uint= 115;
		public static const TAIKO_DRUM:uint= 116;
		public static const MELODIC_TOM:uint= 117;
		public static const SYNTH_DRUM:uint= 118;
		public static const REVERSE_CYMBAL:uint= 119;
		
		public static const GUITAR_FRET_NOISE:uint= 120;
		public static const BREATH_NOISE:uint= 121;
		public static const SEASHORE:uint= 122;
		public static const BIRD_TWEET:uint= 123;
		public static const TELEPHONE_RING:uint= 124;
		public static const HELICOPTER:uint= 125;
		public static const APPLAUSE:uint= 126;
		public static const GUNSHOT:uint= 127;
	}
}