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
import flash.utils.Dictionary;

/**
 * Loads default definitions into the JFugue dictionary.
 * This allows users to refer to instruments, percussion sounds,
 * and controller events by easy-to-remember names.
 *
 * <p>
 * Dictionary items can be added via the Music String.  See
 * the documentation for more information.
 * </p>
 *
 *@author David Koelle
 *@version 2.0
 */
public final class JFugueDefinitions
{
    public function JFugueDefinitions():void { }

    /**
     * Loads default definitions into the JFugue dictionary.  This includes
     * all of the string representations for instrument names, percussion sounds,
     * controller events, and some controller values.
     * @param dictionaryMap the dictionary instantiated by the parser
     */
    public static function populateDictionary(dictionaryMap:Dictionary):void {
        //
        // Instrument names
        //
        dictionaryMap["PIANO"                    ] = "0";
        dictionaryMap["ACOUSTIC_GRAND"           ] = "0";
        dictionaryMap["BRIGHT_ACOUSTIC"          ] = "1";
        dictionaryMap["ELECTRIC_GRAND"           ] = "2";
        dictionaryMap["HONKEY_TONK"              ] = "3";
        dictionaryMap["ELECTRIC_PIANO"           ] = "4";
        dictionaryMap["ELECTRIC_PIANO_1"         ] = "4";
        dictionaryMap["ELECTRIC_PIANO_2"         ] = "5";
        dictionaryMap["HARPISCHORD"              ] = "6";
        dictionaryMap["CLAVINET"                 ] = "7";
        dictionaryMap["CELESTA"                  ] = "8";
        dictionaryMap["GLOCKENSPIEL"             ] = "9";

        dictionaryMap["MUSIC_BOX"                ] = "10";
        dictionaryMap["VIBRAPHONE"               ] = "11";
        dictionaryMap["MARIMBA"                  ] = "12";
        dictionaryMap["XYLOPHONE"                ] = "13";
        dictionaryMap["TUBULAR_BELLS"            ] = "14";
        dictionaryMap["DULCIMER"                 ] = "15";
        dictionaryMap["DRAWBAR_ORGAN"            ] = "16";
        dictionaryMap["PERCUSSIVE_ORGAN"         ] = "17";
        dictionaryMap["ROCK_ORGAN"               ] = "18";
        dictionaryMap["CHURCH_ORGAN"             ] = "19";

        dictionaryMap["REED_ORGAN"               ] = "20";
        dictionaryMap["ACCORDIAN"                ] = "21";
        dictionaryMap["HARMONICA"                ] = "22";
        dictionaryMap["TANGO_ACCORDIAN"          ] = "23";
        dictionaryMap["GUITAR"                   ] = "24";
        dictionaryMap["NYLON_STRING_GUITAR"      ] = "24";
        dictionaryMap["STEEL_STRING_GUITAR"      ] = "25";
        dictionaryMap["ELECTRIC_JAZZ_GUITAR"     ] = "26";
        dictionaryMap["ELECTRIC_CLEAN_GUITAR"    ] = "27";
        dictionaryMap["ELECTRIC_MUTED_GUITAR"    ] = "28";
        dictionaryMap["OVERDRIVEN_GUITAR"        ] = "29";

        dictionaryMap["DISTORTION_GUITAR"        ] = "30";
        dictionaryMap["GUITAR_HARMONICS"         ] = "31";
        dictionaryMap["ACOUSTIC_BASS"            ] = "32";
        dictionaryMap["ELECTRIC_BASS_FINGER"     ] = "33";
        dictionaryMap["ELECTRIC_BASS_PICK"       ] = "34";
        dictionaryMap["FRETLESS_BASS"            ] = "35";
        dictionaryMap["SLAP_BASS_1"              ] = "36";
        dictionaryMap["SLAP_BASS_2"              ] = "37";
        dictionaryMap["SYNTH_BASS_1"             ] = "38";
        dictionaryMap["SYNTH_BASS_2"             ] = "39";

        dictionaryMap["VIOLIN"                   ] = "40";
        dictionaryMap["VIOLA"                    ] = "41";
        dictionaryMap["CELLO"                    ] = "42";
        dictionaryMap["CONTRABASS"               ] = "43";
        dictionaryMap["TREMOLO_STRINGS"          ] = "44";
        dictionaryMap["PIZZICATO_STRINGS"        ] = "45";
        dictionaryMap["ORCHESTRAL_STRINGS"       ] = "46";
        dictionaryMap["TIMPANI"                  ] = "47";
        dictionaryMap["STRING_ENSEMBLE_1"        ] = "48";
        dictionaryMap["STRING_ENSEMBLE_2"        ] = "49";

        dictionaryMap["SYNTH_STRINGS_1"          ] = "50";
        dictionaryMap["SYNTH_STRINGS_2"          ] = "51";
        dictionaryMap["CHOIR_AAHS"               ] = "52";
        dictionaryMap["VOICE_OOHS"               ] = "53";
        dictionaryMap["SYNTH_VOICE"              ] = "54";
        dictionaryMap["ORCHESTRA_HIT"            ] = "55";
        dictionaryMap["TRUMPET"                  ] = "56";
        dictionaryMap["TROMBONE"                 ] = "57";
        dictionaryMap["TUBA"                     ] = "58";
        dictionaryMap["MUTED_TRUMPET"            ] = "59";

        dictionaryMap["FRENCH_HORN"              ] = "60";
        dictionaryMap["BRASS_SECTION"            ] = "61";
        dictionaryMap["SYNTHBRASS_1"             ] = "62";
        dictionaryMap["SYNTHBRASS_2"             ] = "63";
        dictionaryMap["SOPRANO_SAX"              ] = "64";
        dictionaryMap["ALTO_SAX"                 ] = "65";
        dictionaryMap["TENOR_SAX"                ] = "66";
        dictionaryMap["BARITONE_SAX"             ] = "67";
        dictionaryMap["OBOE"                     ] = "68";
        dictionaryMap["ENGLISH_HORN"             ] = "69";

        dictionaryMap["BASSOON"                  ] = "70";
        dictionaryMap["CLARINET"                 ] = "71";
        dictionaryMap["PICCOLO"                  ] = "72";
        dictionaryMap["FLUTE"                    ] = "73";
        dictionaryMap["RECORDER"                 ] = "74";
        dictionaryMap["PAN_FLUTE"                ] = "75";
        dictionaryMap["BLOWN_BOTTLE"             ] = "76";
        dictionaryMap["SKAKUHACHI"               ] = "77";
        dictionaryMap["WHISTLE"                  ] = "78";
        dictionaryMap["OCARINA"                  ] = "79";

        dictionaryMap["LEAD_SQUARE"              ] = "80";
        dictionaryMap["SQUARE"                   ] = "80";
        dictionaryMap["LEAD_SAWTOOTH"            ] = "81";
        dictionaryMap["SAWTOOTH"                 ] = "81";
        dictionaryMap["LEAD_CALLIOPE"            ] = "82";
        dictionaryMap["CALLIOPE"                 ] = "82";
        dictionaryMap["LEAD_CHIFF"               ] = "83";
        dictionaryMap["CHIFF"                    ] = "83";
        dictionaryMap["LEAD_CHARANG"             ] = "84";
        dictionaryMap["CHARANG"                  ] = "84";
        dictionaryMap["LEAD_VOICE"               ] = "85";
        dictionaryMap["VOICE"                    ] = "85";
        dictionaryMap["LEAD_FIFTHS"              ] = "86";
        dictionaryMap["FIFTHS"                   ] = "86";
        dictionaryMap["LEAD_BASSLEAD"            ] = "87";
        dictionaryMap["BASSLEAD"                 ] = "87";
        dictionaryMap["PAD_NEW_AGE"              ] = "88";
        dictionaryMap["NEW_AGE"                  ] = "88";
        dictionaryMap["PAD_WARM"                 ] = "89";
        dictionaryMap["WARM"                     ] = "89";

        dictionaryMap["PAD_POLYSYNTH"            ] = "90";
        dictionaryMap["POLYSYNTH"                ] = "90";
        dictionaryMap["PAD_CHOIR"                ] = "91";
        dictionaryMap["CHOIR"                    ] = "91";
        dictionaryMap["PAD_BOWED"                ] = "92";
        dictionaryMap["BOWED"                    ] = "92";
        dictionaryMap["PAD_METALLIC"             ] = "93";
        dictionaryMap["METALLIC"                 ] = "93";
        dictionaryMap["PAD_HALO"                 ] = "94";
        dictionaryMap["HALO"                     ] = "94";
        dictionaryMap["PAD_SWEEP"                ] = "95";
        dictionaryMap["SWEEP"                    ] = "95";
        dictionaryMap["FX_RAIN"                  ] = "96";
        dictionaryMap["RAIN"                     ] = "96";
        dictionaryMap["FX_SOUNDTRACK"            ] = "97";
        dictionaryMap["SOUNDTRACK"               ] = "97";
        dictionaryMap["FX_CRYSTAL"               ] = "98";
        dictionaryMap["CRYSTAL"                  ] = "98";
        dictionaryMap["FX_ATMOSPHERE"            ] = "99";
        dictionaryMap["ATMOSPHERE"               ] = "99";

        dictionaryMap["FX_BRIGHTNESS"            ] = "100";
        dictionaryMap["BRIGHTNESS"               ] = "100";
        dictionaryMap["FX_GOBLINS"               ] = "101";
        dictionaryMap["GOBLINS"                  ] = "101";
        dictionaryMap["FX_ECHOES"                ] = "102";
        dictionaryMap["ECHOES"                   ] = "102";
        dictionaryMap["FX_SCI-FI"                ] = "103";
        dictionaryMap["SCI-FI"                   ] = "103";
        dictionaryMap["SITAR"                    ] = "104";
        dictionaryMap["BANJO"                    ] = "105";
        dictionaryMap["SHAMISEN"                 ] = "106";
        dictionaryMap["KOTO"                     ] = "107";
        dictionaryMap["KALIMBA"                  ] = "108";
        dictionaryMap["BAGPIPE"                  ] = "109";

        dictionaryMap["FIDDLE"                   ] = "110";
        dictionaryMap["SHANAI"                   ] = "111";
        dictionaryMap["TINKLE_BELL"              ] = "112";
        dictionaryMap["AGOGO"                    ] = "113";
        dictionaryMap["STEEL_DRUMS"              ] = "114";
        dictionaryMap["WOODBLOCK"                ] = "115";
        dictionaryMap["TAIKO_DRUM"               ] = "116";
        dictionaryMap["MELODIC_TOM"              ] = "117";
        dictionaryMap["SYNTH_DRUM"               ] = "118";
        dictionaryMap["REVERSE_CYMBAL"           ] = "119";

        dictionaryMap["GUITAR_FRET_NOISE"        ] = "120";
        dictionaryMap["BREATH_NOISE"             ] = "121";
        dictionaryMap["SEASHORE"                 ] = "122";
        dictionaryMap["BIRD_TWEET"               ] = "123";
        dictionaryMap["TELEPHONE_RING"           ] = "124";
        dictionaryMap["HELICOPTER"               ] = "125";
        dictionaryMap["APPLAUSE"                 ] = "126";
        dictionaryMap["GUNSHOT"                  ] = "127";

        //
        // Percussion names
        //
        dictionaryMap["ACOUSTIC_BASS_DRUM"     ] = "35";
        dictionaryMap["BASS_DRUM"              ] = "36";
        dictionaryMap["SIDE_STICK"             ] = "37";
        dictionaryMap["ACOUSTIC_SNARE"         ] = "38";
        dictionaryMap["HAND_CLAP"              ] = "39";

        dictionaryMap["ELECTRIC_SNARE"         ] = "40";
        dictionaryMap["LOW_FLOOR_TOM"          ] = "41";
        dictionaryMap["CLOSED_HI_HAT"          ] = "42";
        dictionaryMap["HIGH_FLOOR_TOM"         ] = "43";
        dictionaryMap["PEDAL_HI_HAT"           ] = "44";
        dictionaryMap["LOW_TOM"                ] = "45";
        dictionaryMap["OPEN_HI_HAT"            ] = "46";
        dictionaryMap["LOW_MID_TOM"            ] = "47";
        dictionaryMap["HI_MID_TOM"             ] = "48";
        dictionaryMap["CRASH_CYMBAL_1"         ] = "49";

        dictionaryMap["HIGH_TOM"               ] = "50";
        dictionaryMap["RIDE_CYMBAL_1"          ] = "51";
        dictionaryMap["CHINESE_CYMBAL"         ] = "52";
        dictionaryMap["RIDE_BELL"              ] = "53";
        dictionaryMap["TAMBOURINE"             ] = "54";
        dictionaryMap["SPLASH_CYMBAL"          ] = "55";
        dictionaryMap["COWBELL"                ] = "56";
        dictionaryMap["CRASH_CYMBAL_2"         ] = "57";
        dictionaryMap["VIBRASLAP"              ] = "58";
        dictionaryMap["RIDE_CYMBAL_2"          ] = "59";

        dictionaryMap["HI_BONGO"               ] = "60";
        dictionaryMap["LOW_BONGO"              ] = "61";
        dictionaryMap["MUTE_HI_CONGA"          ] = "62";
        dictionaryMap["OPEN_HI_CONGA"          ] = "63";
        dictionaryMap["LOW_CONGA"              ] = "64";
        dictionaryMap["HIGH_TIMBALE"           ] = "65";
        dictionaryMap["LOW_TIMBALE"            ] = "66";
        dictionaryMap["HIGH_AGOGO"             ] = "67";
        dictionaryMap["LOW_AGOGO"              ] = "68";
        dictionaryMap["CABASA"                 ] = "69";

        dictionaryMap["MARACAS"                ] = "70";
        dictionaryMap["SHORT_WHISTLE"          ] = "71";
        dictionaryMap["LONG_WHISTLE"           ] = "72";
        dictionaryMap["SHORT_GUIRO"            ] = "73";
        dictionaryMap["LONG_GUIRO"             ] = "74";
        dictionaryMap["CLAVES"                 ] = "75";
        dictionaryMap["HI_WOOD_BLOCK"          ] = "76";
        dictionaryMap["LOW_WOOD_BLOCK"         ] = "77";
        dictionaryMap["MUTE_CUICA"             ] = "78";
        dictionaryMap["OPEN_CUICA"             ] = "79";

        dictionaryMap["MUTE_TRIANGLE"          ] = "80";
        dictionaryMap["OPEN_TRIANGLE"          ] = "81";

        //
        // Controller names
        //
        dictionaryMap["BANK_SELECT_COARSE"          ] = "0";
        dictionaryMap["MOD_WHEEL_COARSE"            ] = "1";
        dictionaryMap["BREATH_COARSE"               ] = "2";
        dictionaryMap["FOOT_PEDAL_COARSE"           ] = "4";
        dictionaryMap["PORTAMENTO_TIME_COARSE"      ] = "5";
        dictionaryMap["DATA_ENTRY_COARSE"           ] = "6";
        dictionaryMap["VOLUME_COARSE"               ] = "7";
        dictionaryMap["BALANCE_COARSE"              ] = "8";
        dictionaryMap["PAN_POSITION_COARSE"         ] = "10";
        dictionaryMap["EXPRESSION_COARSE"           ] = "11";
        dictionaryMap["EFFECT_CONTROL_1_COARSE"     ] = "12";
        dictionaryMap["EFFECT_CONTROL_2_COARSE"     ] = "13";

        dictionaryMap["SLIDER_1"                    ] = "16";
        dictionaryMap["SLIDER_2"                    ] = "17";
        dictionaryMap["SLIDER_3"                    ] = "18";
        dictionaryMap["SLIDER_4"                    ] = "19";

        dictionaryMap["BANK_SELECT_FINE"            ] = "32";
        dictionaryMap["MOD_WHEEL_FINE"              ] = "33";
        dictionaryMap["BREATH_FINE"                 ] = "34";
        dictionaryMap["FOOT_PEDAL_FINE"             ] = "36";
        dictionaryMap["PORTAMENTO_TIME_FINE"        ] = "37";
        dictionaryMap["DATA_ENTRY_FINE"             ] = "38";
        dictionaryMap["VOLUME_FINE"                 ] = "39";
        dictionaryMap["BALANCE_FINE"                ] = "40";
        dictionaryMap["PAN_POSITION_FINE"           ] = "42";
        dictionaryMap["EXPRESSION_FINE"             ] = "43";
        dictionaryMap["EFFECT_CONTROL_1_FINE"       ] = "44";
        dictionaryMap["EFFECT_CONTROL_2_FINE"       ] = "45";

        dictionaryMap["HOLD_PEDAL"                  ] = "64";
        dictionaryMap["HOLD"                        ] = "64";
        dictionaryMap["PORTAMENTO"                  ] = "65";
        dictionaryMap["SUSTENUTO_PEDAL"             ] = "66";
        dictionaryMap["SUSTENUTO"                   ] = "66";
        dictionaryMap["SOFT_PEDAL"                  ] = "67";
        dictionaryMap["SOFT"                        ] = "67";
        dictionaryMap["LEGATO_PEDAL"                ] = "68";
        dictionaryMap["LEGATO"                      ] = "68";
        dictionaryMap["HOLD_2_PEDAL"                ] = "69";
        dictionaryMap["HOLD_2"                      ] = "69";

        dictionaryMap["SOUND_VARIATION"             ] = "70";
        dictionaryMap["VARIATION"                   ] = "70";
        dictionaryMap["SOUND_TIMBRE"                ] = "71";
        dictionaryMap["TIMBRE"                      ] = "71";
        dictionaryMap["SOUND_RELEASE_TIME"          ] = "72";
        dictionaryMap["RELEASE_TIME"                ] = "72";
        dictionaryMap["SOUND_ATTACK_TIME"           ] = "73";
        dictionaryMap["ATTACK_TIME"                 ] = "73";
        dictionaryMap["SOUND_BRIGHTNESS"            ] = "74";
        dictionaryMap["BRIGHTNESS"                  ] = "74";
        dictionaryMap["SOUND_CONTROL_6"             ] = "75";
        dictionaryMap["CONTROL_6"                   ] = "75";
        dictionaryMap["SOUND_CONTROL_7"             ] = "76";
        dictionaryMap["CONTROL_7"                   ] = "76";
        dictionaryMap["SOUND_CONTROL_8"             ] = "77";
        dictionaryMap["CONTROL_8"                   ] = "77";
        dictionaryMap["SOUND_CONTROL_9"             ] = "78";
        dictionaryMap["CONTROL_9"                   ] = "78";
        dictionaryMap["SOUND_CONTROL_10"            ] = "79";
        dictionaryMap["CONTROL_10"                  ] = "79";

        dictionaryMap["GENERAL_PURPOSE_BUTTON_1"    ] = "80";
        dictionaryMap["GENERAL_BUTTON_1"            ] = "80";
        dictionaryMap["BUTTON_1"                    ] = "80";
        dictionaryMap["GENERAL_PURPOSE_BUTTON_2"    ] = "81";
        dictionaryMap["GENERAL_BUTTON_2"            ] = "81";
        dictionaryMap["BUTTON_2"                    ] = "81";
        dictionaryMap["GENERAL_PURPOSE_BUTTON_3"    ] = "82";
        dictionaryMap["GENERAL_BUTTON_3"            ] = "82";
        dictionaryMap["BUTTON_3"                    ] = "82";
        dictionaryMap["GENERAL_PURPOSE_BUTTON_4"    ] = "83";
        dictionaryMap["GENERAL_BUTTON_4"            ] = "83";
        dictionaryMap["BUTTON_4"                    ] = "83";

        dictionaryMap["EFFECTS_LEVEL"               ] = "91";
        dictionaryMap["EFFECTS"                     ] = "91";
        dictionaryMap["TREMULO_LEVEL"               ] = "92";
        dictionaryMap["TREMULO"                     ] = "92";
        dictionaryMap["CHORUS_LEVEL"                ] = "93";
        dictionaryMap["CHORUS"                      ] = "93";
        dictionaryMap["CELESTE_LEVEL"               ] = "94";
        dictionaryMap["CELESTE"                     ] = "94";
        dictionaryMap["PHASER_LEVEL"                ] = "95";
        dictionaryMap["PHASER"                      ] = "95";

        dictionaryMap["DATA_BUTTON_INCREMENT"       ] = "96";
        dictionaryMap["DATA_BUTTON_INC"             ] = "96";
        dictionaryMap["BUTTON_INC"                  ] = "96";
        dictionaryMap["DATA_BUTTON_DECREMENT"       ] = "97";
        dictionaryMap["DATA_BUTTON_DEC"             ] = "97";
        dictionaryMap["BUTTON_DEC"                  ] = "97";

        dictionaryMap["NON_REGISTERED_COARSE"       ] = "98";
        dictionaryMap["NON_REGISTERED_FINE"         ] = "99";
        dictionaryMap["REGISTERED_COARSE"           ] = "100";
        dictionaryMap["REGISTERED_FINE"             ] = "101";

        dictionaryMap["ALL_SOUND_OFF"               ] = "120";
        dictionaryMap["ALL_CONTROLLERS_OFF"         ] = "121";
        dictionaryMap["LOCAL_KEYBOARD"              ] = "122";
        dictionaryMap["ALL_NOTES_OFF"               ] = "123";
        dictionaryMap["OMNI_MODE_OFF"               ] = "124";
        dictionaryMap["OMNI_OFF"                    ] = "124";
        dictionaryMap["OMNI_MODE_ON"                ] = "125";
        dictionaryMap["OMNI_ON"                     ] = "125";
        dictionaryMap["MONO_OPERATION"              ] = "126";
        dictionaryMap["MONO"                        ] = "126";
        dictionaryMap["POLY_OPERATION"              ] = "127";
        dictionaryMap["POLY"                        ] = "127";

        //
        // Combined Controller names
        // (index ] = coarse_controller_index * 128 + fine_controller_index)
        //
        dictionaryMap["BANK_SELECT"                ] = "16383";
        dictionaryMap["MOD_WHEEL"                  ] = "161";
        dictionaryMap["BREATH"                     ] = "290";
        dictionaryMap["FOOT_PEDAL"                 ] = "548";
        dictionaryMap["PORTAMENTO_TIME"            ] = "677";
        dictionaryMap["DATA_ENTRY"                 ] = "806";
        dictionaryMap["VOLUME"                     ] = "935";
        dictionaryMap["BALANCE"                    ] = "1064";
        dictionaryMap["PAN_POSITION"               ] = "1322";
        dictionaryMap["EXPRESSION"                 ] = "1451";
        dictionaryMap["EFFECT_CONTROL_1"           ] = "1580";
        dictionaryMap["EFFECT_CONTROL_2"           ] = "1709";
        dictionaryMap["NON_REGISTERED"             ] = "12770";
        dictionaryMap["REGISTERED"                 ] = "13028";

        //
        // Values for controllers
        //
        dictionaryMap["ON"                         ] = "127";
        dictionaryMap["OFF"                        ] = "0";
        dictionaryMap["DEFAULT"                    ] = "64";

        //
        // Tempo values
        // (NEW for JFugue 4.0)
        dictionaryMap["GRAVE"                      ] = "40";
        dictionaryMap["LARGO"                      ] = "45";
        dictionaryMap["LARGHETTO"                  ] = "50";
        dictionaryMap["LENTO"                      ] = "55";
        dictionaryMap["ADAGIO"                     ] = "60";
        dictionaryMap["ADAGIETTO"                  ] = "65";

        dictionaryMap["ANDANTE"                    ] = "70";
        dictionaryMap["ANDANTINO"                  ] = "80";
        dictionaryMap["MODERATO"                   ] = "95";
        dictionaryMap["ALLEGRETTO"                 ] = "110";

        dictionaryMap["ALLEGRO"                    ] = "120";
        dictionaryMap["VIVACE"                     ] = "145";
        dictionaryMap["PRESTO"                     ] = "180";
        dictionaryMap["PRETISSIMO"                 ] = "220";
    }
}
}