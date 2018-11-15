package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.audio1.Audio;
import kha.audio1.AudioChannel;
import kha.Sound;
import kha.arrays.Float32Array;

class Project {
	var sndWhiteNoise:AudioChannel;
	var sampleRate = 48000;

	public function new(){
		var sound = new Sound();
		sound.uncompressedData = new Float32Array(sampleRate);
		for (i in 0 ... sound.uncompressedData.length){
			sound.uncompressedData[i] = Math.random() * 2 - 1;
		}
		sndWhiteNoise = Audio.play(sound, true);
		sndWhiteNoise.volume = 0.1;
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		
		graphics.end();
	}
}
