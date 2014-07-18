package org.cim.old {
	import flash.utils.Dictionary;
	
	import spark.components.Label;
	
	/**
	 * The Clef class is a label that can be used in rendering
	 * a score.  It stores information when parsed from MusicXML
	 * and can be added on screen when desired.
	 */
	public class Clef extends Label {
		/**
		 * The staff the clef appears on.
		 */
		public var staffNumber:int = 1;
		
		/**
		 * The sign of the clef, as in G-clef, C-clef, or F-clef.
		 */
		public var sign:String;
		public static const G_CLEF:String = "G";
		public static const C_CLEF:String = "C";
		public static const F_CLEF:String = "F";
		
		/**
		 * The line of the clef.  This, in combination with the sign,
		 * makes the clef unique.  A C-Clef becomes alto or tenor clef 
		 * depending on the line.
		 */
		public var line:int;
		
		/**
		 * A dictionary representing the clef sign and its corresponding
		 * unicode value.  For use when displaying with a font.
		 */
		public static const unicodeClefDictionary:Dictionary = new Dictionary();
		unicodeClefDictionary[G_CLEF] = 0xF026;
		unicodeClefDictionary[C_CLEF] = 0xF042;
		unicodeClefDictionary[F_CLEF] = 0xF034;
		
		/**
		 * Defines the starting pitch for each clef.
		 * The starting pitch is here defined as the note that lies 
		 * on the bottom most line (beam) of the staff.
		 */
		public static const clefStartingPitch:Dictionary = new Dictionary();
		clefStartingPitch[G_CLEF] = "E4";
		clefStartingPitch[C_CLEF] = "F3"; // double check this!
		clefStartingPitch[F_CLEF] = "G2";
		
		/**
		 * Draws the clef using the unicode value associated with 
		 * the clef's sign.
		 */
		public function draw():void {
			// get the note from the font
			var noteString:String = String.fromCharCode(unicodeClefDictionary[this.sign]);
			
			// set styling information
			this.setStyle("fontSize", 15);
			this.setStyle("fontFamily", "opusFont")
			this.text = noteString;
			
			//@@WORK - we do REALLY want to be able to base the size of 
			// this label on its text content
			//this.width = text.measureText(clef).height;
			//this.height = text.measureText(clef).height;
			this.width = 24;
			this.height = 24;
		}
	}
}