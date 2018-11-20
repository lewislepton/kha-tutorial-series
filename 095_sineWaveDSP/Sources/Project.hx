package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.audio1.Audio;
import kha.audio1.AudioChannel;
import kha.Sound;
import kha.arrays.Float32Array;

class Project {
	var sndSineWave:AudioChannel;
	var frequency = 440;
	var sampleRate = 48000;

	public function new(){
		var sound = new Sound();
		sound.uncompressedData = new Float32Array(sampleRate);
		var sampleFrequency = sampleRate / frequency;
		for (i in 0 ... sound.uncompressedData.length){
			sound.uncompressedData[i] = Math.sin(i / (sampleFrequency / (Math.PI * 2)));
		}
		sndSineWave = Audio.play(sound, true);
		sndSineWave.volume = 0.1;
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		
		graphics.end();
	}
}
