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
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	import mx.core.UIComponent;
	
	import spark.components.Label;
	
	/**
	 * A measure represents a measure of musical notes and directions.
	 * When rendering, all notes and directions are passed to a measure.
	 * A measure is ultimately responsible for rendering the notes and directions.
	 */
	public final class Measure extends UIComponent {
		/**
		 * The measure number.
		 */
		public var number:int;
		
		/**
		 * Whether or not this measure should start a new system.
		 */
		public var newSystem:Boolean = false;
		
		/**
		 * Whether or not this measure should start a new page.
		 */
		public var newPage:Boolean = false;
		
		/**
		 * Stores information in XML regarding margins and such about this measure.
		 * Should carry forward until the next change.
		 */
		public var systemLayout:XML;
		
		/**
		 * The time signature this measure is in.  Should carry forward 
		 * until the next change.
		 */
		public var timeSignature:TimeSignature;
		
		/**
		 * The key this measure is in.  Should carry forward 
		 * until the next change.
		 */
		public var keySignature:KeySignature;
		
		/**
		 * The number of staffs in this measure.
		 */
		public var staffCount:int = 1;
		
		/**
		 * The clefs used in the stafs.  Staff count should 
		 * be equal to the length of this array.
		 */
		public var clefs:Array = new Array();
		
		/**
		 * The notes that are part of this measure.
		 */
		public var notes:Array = new Array();
		
		/**
		 * Draws the measure, notes, and directions onto this component.
		 */
		public function draw(staffDistance:int = undefined):void {
			// reset everything
			this.width = 100;
			var runningX:int = 0;
			var runningY:int = 0;
			graphics.clear();
			graphics.beginFill(0x000000);
			
			// draw measure number
			if(this.newSystem || this.newPage || this.number == 1) {
				var label:Label = new Label();
				this.addChild(label);
				label.setStyle("fontSize", 12);
				label.setStyle("fontFamily", "opusFont");
				label.setStyle("verticalAlign", "bottom");
				label.text = String(this.number);
				label.width = 100;
				label.height = 20;
				label.x = 4;
				label.y = startingY - 20;
			}
			
			// store the y position of the starting note 
			// for the measure based on the measure's clef
			var clefStartingPitchY:Dictionary = new Dictionary();
			
			// store the current x position for drawing, but dependent 
			// on the staff
			var runningXs:Dictionary = new Dictionary();
			
			// loop through each clef
			for each(var clef:Clef in clefs) {
				// draw the bars
				// store where we start in y
				var startingY:int = runningY;
				
				// store the starting point for notes for this clef
				clefStartingPitchY[clef.staffNumber] = startingY + 40;
				
				// store the current x for notes
				runningXs[clef.staffNumber] = 4;
				
				// loop for each beam (5 beams)
				for(var i:int = 0; i < 5; i++) {
					// draw it!
					graphics.drawRect(0, runningY, this.width, 1.5);
					runningY += 10;
				}
				
				// increment our y by the distance each staff is to be separated by
				runningY += staffDistance
			}
			
			// save the height minus the extra staff distance added on
			this.height = runningY - staffDistance - 10;
			
			// draw bars
			graphics.drawRect(0, 0, 1.5, this.height); // start
			graphics.drawRect(this.width, 0, 1.5, this.height); // end
			
			// end the fill
			graphics.endFill();
			
			// start adding the notes
			var lastNote:Note;
			for each(var note:Note in notes) {
				// get the y position
				var yPosition:int;
				
				// see if it's a rest or not
				if(note.isRest) {
					yPosition = clefStartingPitchY[note.staffNumber] - 20;
				} else {
					// first, get the base value of the clef we're at
					//@@WORK shouldn't use array position, should be like 
					//dictionary (we don't know the order clefs are in XML)
					var baseIsoPitch:int = Pitch.isoPitch(Clef.clefStartingPitch[clefs[note.staffNumber - 1].sign]);
					
					// get the change from the base pitch to this note's pitch
					var deltaPitch:int = note.pitch.isoPitch - baseIsoPitch;
					
					// now we can create a position from this
					yPosition = clefStartingPitchY[note.staffNumber] - (deltaPitch * 5);
				}
				
				// don't move if:
				// first note in bar
				// last note is not a chord, this note is a chord
				
				// move if:
				// last note is a chord, this note is not a chord
				// last note is not a chord, this note is not a chord
				if((lastNote && ((lastNote.isChord && !note.isChord) || (!lastNote.isChord && !note.isChord))) && (lastNote.staffNumber == note.staffNumber)) {
					// do move
					runningXs[note.staffNumber] += 24;
				}
				
				// see if the next note is a chord (for tail drawing purposes)
				var ignoreTail:Boolean = false;
				var currentIndex:int = notes.indexOf(note);
				
				// get the next note
				if(currentIndex < notes.length - 1) {
					var nextNote:Note = notes[currentIndex + 1];
					
					// if we're on the same staff,
					// this note is not a chord and the next is, or 
					// this note and the next note are a chord, and
					// this note is an eighth or smaller, then ignore the tail
					if(nextNote.staffNumber == note.staffNumber) {
						if((!note.isChord && nextNote.isChord) ||
							(note.isChord && nextNote.isChord)) {
							if(note.type == Note.EIGHTH || note.type == Note.SIXTEENTH) {
								ignoreTail = true;
							}
						}
					}
				}
				
				// add and position the note
				this.addChild(note);
				note.draw(ignoreTail);
				note.x = runningXs[note.staffNumber];
				//@@WORK - fix the adjustments... we should really only have note.height and a small 
				// number to accont for moving to the middle (3.25)... but it was an entire step off... (hence the 10)
				if(note.type == Note.WHOLE) {
					if(note.isRest) {
						// move a whole note rest up a bar
						note.y = yPosition - note.height + 1.5 + 10;
					} else {
						note.y = yPosition - note.height + 3.25 + 10;
					}
				} else {
					note.y = yPosition - note.height + 7.6 + 10;
				}
				
				// store this as the previous note for the next iteration
				lastNote = note;
			}
		}
		
		/**
		 * Returns the width of the measure after all rendering has been done.
		 */
		public function get finishedWidth():int {
			// for now, just 100... later we will return the dynamic width
			return 100;
		}
		
		/**
		 * Returns the height of the measure after all rendering has been done.
		 */
		public function get finishedHeight():int {
			return this.height;
		}
	}
}
