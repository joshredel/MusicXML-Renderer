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

package org.jfugue {
/**
 * Handles JFugue parsing exceptions.
 *
 *@author David Koelle
 *@version 2.0
 */
public class JFugueException extends Error
{
    /**
     * Create a new JFugueException.
     *
     * @param exc The string representing the exception.  This should contain the * character, so 'param' can be placed into the string.
     * @param param The direct object of the exception, the thing that has had some problem with it
     * @param token The token or dictionary entry in which the exception has been discovered
     */
    public function JFugueException(exc:String, param:String=null, token:String=null)
    {
		var message:String = "";
        if(!param && !token) {
			message = exc;
		} else if(!token) {
			token = param;
			message = exc + " Found while parsing the following token, word, or definition: "+token;
		} else {
			message = exc.substring(0, exc.indexOf('*')) + param + exc.substring(exc.indexOf('*')+1, exc.length) + " Found while parsing the following token, word, or definition: "+token;
		}
		
		super(message);
    }

    /** The Voice command, V<i>voice</i>, is out of range. */
    public static const VOICE_EXC:String= "Voice * is not a number, or is not in the range 0 - 127.";
    /** The Tempo command, T<i>tempo</i>, is out of range. */
    public static const TEMPO_EXC:String= "Tempo * is not a number";
    /** The KeySignature command, K<i>keysig</i>, is poorly formed. */
    public static const KEYSIG_EXC:String= " * is not a proper key signature; should be like KC#maj or KAbmin.";
    /** The Layer command, L<i>layer</i>, is out of range. */
    public static const LAYER_EXC:String= "Layer * is not a number, or is not in the range 0 - 127.";
    /** The Instrument command, I<i>instrument</i>, is not a valid instrument. */
    public static const INSTRUMENT_EXC:String= "Instrument * is not a valid instrument name, or is not in the range 0 - 127.";
    /** The index of the Controller command, X<i>index</i>=<i>value</i>, is not a valid controller. */
    public static const CONTROL_EXC:String= "Control * is not a valid controller name, or is not in the range 0 - 127.";
    /** The Note command does not specify a valid percussion sound. */
    public static const NOTE_EXC:String= "Note * is not a valid drum sound name, or is not in the range 0 - 127.";
    /** The Octave specifier within the Note command is out of range. */
    public static const OCTAVE_EXC:String= "Octave * is not a number, or is not in the range 0 - 10.";
    /** The Octave value calculated by the parser is out of range. */
    public static const NOTE_OCTAVE_EXC:String= "The note value *, calculated by computing (octave*12)+noteValue, is not in the range 0 - 127.";
    /** The Duration part of the MusicString has an error. */
    public static const NOTE_DURATION_EXC:String= "The Duration part of the MusicString has an error.";
    /** The Velocity character is not known. */
    public static const NOTE_VELOCITY_EXC:String= "The velocity character in * is unknown.";
    /** The root note for a chord inversion has an error. */
    public static const INVERSION_EXC:String= "The root given for a chord inversion is less than the initial chord root, or greater than the range of the chord.";

    /** The parser encountered spaces in a single token. */
    public static const PARSER_SPACES_EXC:String= "The token * sent to Parser.parse() contains spaces.  A token is one unit of musical data, and should not contain a space.";
    /** The parser cannot find a definition for the given word. */
    public static const WORD_NOT_DEFINED_EXC:String= "The word * has no definition.  Check the spelling, or define the word before using it.  See the JFugue Instruction Manual for information on defining words.";
    /** The Controller command, X<i>index</i>=<i>value</i>, is malformed. */
    public static const CONTROL_FORMAT_EXC:String= "The controller token * is missing an equals sign.  See the JFugue Instruction Manual for information on using the Controller token.";

    /** The parser expected a byte. */
    public static const EXPECTED_BYTE:String= "The JFugue Parser expected a byte, but encountered the value * which is not a byte.";
    /** The parser expected a long. */
    public static const EXPECTED_LONG:String= "The JFugue Parser expected a long, but encountered the value * which is not a long.";
    /** The parser expected an int. */
    public static const EXPECTED_INT:String= "The JFugue Parser expected an int, but encountered the value * which is not an int.";
    /** The parser expected a double. */
    public static const EXPECTED_DOUBLE:String= "The JFugue Parser expected a double, but encountered the value * which is not a double.";
    
    /** The MIDI System cannot instantiate a sequencer. */
    public static const SEQUENCER_DEVICE_NOT_SUPPORTED_WITH_EXCEPTION:String= "The MIDI System cannot instantiate a sequencer.  Although this error is reported by JFugue, the problem is not with JFugue itself.  Find resources for using MIDI on your specific system.  The exception message from MidiSystem.getSequencer() is: ";
    /** The MIDI System cannot instantiate a sequencer. */
    public static const SEQUENCER_DEVICE_NOT_SUPPORTED:String= "The MIDI System cannot instantiate a sequencer.  Although this error is reported by JFugue, the problem is not with JFugue itself.  Find resources for using MIDI on your specific system.";

    /** Player.play(String) plays a music string, not a filename */
    public static const PLAYS_STRING_NOT_FILE_EXC:String= "play(String) plays a music string, not a filename.  Try using play(File).";

    /** Error playing music */
    public static const ERROR_PLAYING_MUSIC:String= "Error playing music: ";

    /** Error while sleep */
    public static const ERROR_SLEEP:String= "Error while sleeping";
    
    /** Error resolving MidiDevice with Intelligent Resolver */
    public static const INTELLIGENT_RESOLVER_FAILED:String= "IntelligentDeviceResolver not intelligent enough.  Be explicit about the MidiDevice.";

    /** Verification exception */
    public static const VERIFICATION_EXCEPTION:String= "The result of parsing, '*', was not expected.";
    
    /** General error */
    public static const GENERAL_ERROR:String= "General error: ";
    
    /** Error for MusicXMLParser (TODO: Should this reside in MusicXMLParser?) */
    public static const BEAT_UNIT_MUST_BE_QUARTER:String= "MusicXML tag \"beat-unit\" must be set to \"quarter\"";

}
}