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
	 * Represents tempo changes.  Tempo is kept for the whole
	 * song, and is independent of tracks.  You may change the
	 * tempo during a song.
	 *
	 * As of JFugue 4.0, Tempo represents the Beats Per Minute (BPM).
	 * In previous versions, Tempo was measured in microseconds per beat,
	 * which is how MIDI maintains this information.
	 * (tempo = 60000 / BPM, and BPM = 60000 / tempo)
	 *
	 *@author David Koelle
	 *@version 2.0
	 *@version 4.0
	 */
	public final class Tempo {
		public var tempo:int;
		
		/**
		 * Creates a new Tempo object, with the specified tempo value (in BPM).
		 * @param tempo the tempo for this object, in Beats Per Minute
		 */
		public function Tempo(tempoInBPM:int) {
			tempo = tempoInBPM;
		}
		
		public static const GRAVE:int= 40;
		public static const LARGO:int= 45;
		public static const LARGHETTO:int= 50;
		public static const LENTO:int= 55;
		public static const ADAGIO:int= 60;
		public static const ADAGIETTO:int= 65;
		
		public static const ANDANTE:int= 70;
		public static const ANDANTINO:int= 80;
		public static const MODERATO:int= 95;
		public static const ALLEGRETTO:int= 110;
		
		public static const ALLEGRO:int= 120;
		public static const VIVACE:int= 145;
		public static const PRESTO:int= 180;
		public static const PRETISSIMO:int= 220;
	}
}