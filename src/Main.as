package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.SampleDataEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author Nicholas Hallman
	 */
	public class Main extends Sprite 
	{
		var sound:Sound = new Sound;
		var noise:Number = 0;
		var conA:Number = 2760
		var steps:Number = -9
		var f:Number = conA * Math.pow(Math.pow(2, (1 / 12)), steps)
		public var i:int = 0
		
		var v: Number = 1
		
		
		
		
		public function Main() 
		{
			sound.addEventListener(SampleDataEvent.SAMPLE_DATA, genSound);
			sound.play()
			
			for ( i = 0; i < 11; i++) {
				var key: Key = new Key()
				key.x = (i * 10) + (2 * i) + 100
				key.y = 200
				stage.addChild(key)
			}
			
		}
		
		private function genSound(e:SampleDataEvent):void {	
			for (var i = 0; i < 8192; i++) {
				noise += 1
				var sampleNumber = noise
				e.data.writeFloat(v * Math.sin(sampleNumber * f / 44100))
				e.data.writeFloat(v * Math.sin(sampleNumber * f / 44100))
				
			}

		}
		
	}
	
}