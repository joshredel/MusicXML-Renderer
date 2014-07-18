package org.cim.old
{
	public class StringBuffer
	{
		private var buffer:Array;
		
		public function StringBuffer()
		{
			buffer = new Array();
		}
		
		public function append(source:*):void {
			for (var i:uint =0; i < source.toString().length(); i++)
			{
				//buffer.push(encodeSomethingAsInt(source.toString().getCharAt(i)));
				source.toString().charCodeAt(i);
			}
		}
		
		public function toString():String {
			return String.fromCharCode.apply(null, buffer);
		}
	}
}