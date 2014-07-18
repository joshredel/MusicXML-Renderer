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
	 * Represents voice changes, also known as <i>track changes</i>.
	 *
	 *@author David Koelle
	 *@version 1.0
	 */
	public final class Voice {
		public var voice:uint;
		
		/**
		 * Creates a new Voice object, with the specified voice value.
		 * @param voice the voice for this object
		 */
		public function Voice(voice:uint) {
			this.voice = voice;
		}
	}
}