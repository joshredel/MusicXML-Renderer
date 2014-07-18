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
	 * The KeySignature is used to convey key signature information from 
	 * the parser to the renderer.
	 */
	public final class KeySignature {
		/**
		 * The "fifths" element from the MusicXML file.
		 */
		public var keySig:uint;
		
		/**
		 * The scale of the key signature, 0 for major, 1 for minor.
		 */
		public var scale:uint;
		
		/**
		 * Constructor.
		 * Creates a new key signature object with the passed values.
		 */
		public function KeySignature(keySig:uint, scale:uint) {
			this.keySig = keySig;
			this.scale = scale;
		}
		
		/**
		 * An array of major key signatures.
		 */
		private static const majorSigs:Array= new Array("Cb", "Gb", "Db", "Ab", "Eb", "Bb", "F", "C", "G", "D", "A", "E", "B", "F#", "C#");
		
		/**
		 * An array of minor key signatures.
		 */
		private static const minorSigs:Array= new Array("Ab", "Eb", "Bb", "F", "C", "G", "D", "A", "E", "B", "F#", "C#", "G#", "D#", "A#");
	}
}