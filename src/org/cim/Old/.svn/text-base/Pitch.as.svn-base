package org.cim.old {
	/**
	 * The Pitch class contains information regarding the pitch of a note.
	 */
	public final class Pitch {
		/**
		 * The note (A-G)
		 */
		public var step:String;
		
		/**
		 * Flat, sharp, etc.
		 */
		public var alter:int;
		
		/**
		 * The octave, e.g. the 3 in C3.
		 */
		public var octave:int;
		
		/**
		 * Returns the standard pitch (e.g. C3).
		 * NOTE: we need to add sharp/flat representation
		 */
		public function get pitch():String {
			return new String(step + octave);
		}
		
		/**
		 * Returns an isomorphic representation of the pitch.
		 */
		public function get isoPitch():int {
			var noteNumber:int;
			switch(step) {
				case "C":
					noteNumber = 0;
					break;
				case "D":
					noteNumber = 1;
					break;
				case "E":
					noteNumber = 2;
					break;
				case "F":
					noteNumber = 3;
					break;
				case "G":
					noteNumber = 4;
					break;
				case "A":
					noteNumber = 5;
					break;
				case "B":
					noteNumber = 6;
					break;
			}
			
			// compute the actual note number, based on octave and note
			var intNoteNumber:int = (octave * 7) + noteNumber;
			return intNoteNumber;
		}
		
		/**
		 * Statically returns an isomorphic representation of the pitch.
		 */
		public static function isoPitch(letters:String):int {
			var step:String = letters.charAt(0);
			var octave:int = parseInt(letters.charAt(1));
			
			var noteNumber:int;
			switch(step) {
				case "C":
					noteNumber = 0;
					break;
				case "D":
					noteNumber = 1;
					break;
				case "E":
					noteNumber = 2;
					break;
				case "F":
					noteNumber = 3;
					break;
				case "G":
					noteNumber = 4;
					break;
				case "A":
					noteNumber = 5;
					break;
				case "B":
					noteNumber = 6;
					break;
			}
			
			// compute the actual note number, based on octave and note
			var intNoteNumber:int = (octave * 7) + noteNumber;
			return intNoteNumber;
		}
	}
}