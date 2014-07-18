package org.cim.old {
	/**
	 * The Time Signature stores information about the time signature of 
	 * a measure or measures.
	 */
	public final class TimeSignature {
		/**
		 * A string representation of the time signature.
		 * (e.g. "cut" for cut-time)
		 */
		public var symbol:String;
		
		/**
		 * Time is beats/beatType (e.g. 2/4)
		 */
		public var beats:int;
		public var beatType:int;
	}
}