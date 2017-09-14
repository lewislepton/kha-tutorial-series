package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Mouse;
import kha.audio1.Audio;
import kha.audio1.AudioChannel;

import Button;

class Project {
	var volume:Float = 100;
	var btnDown:Button;
	var btnUp:Button;
	var sndDrum:AudioChannel;

	public function new() {
		sndDrum = Audio.play(Assets.sounds.drumloop, true);

		btnDown = new Button(0, 512, 64, 64, Color.Pink);
		btnDown.onClick = volumeDown;

		btnUp = new Button(512, 512, 64, 64, Color.Pink);
		btnUp.onClick = volumeUp;

		Mouse.get().notify(onMouseDown, onMouseUp, null, null);
	}

	public function update():Void {
		if (sndDrum.volume <= 0){
			sndDrum.volume = 0.0;
			volume = 0;
		} else if (sndDrum.volume >= 1){
			sndDrum.volume = 1.0;
			volume = 100;
		}

		if (btnDown.isClicked){
			trace('BTN DOWN CLICKED');
		} else if (btnUp.isClicked){
			trace('BTN UP CLICKED');
		}

		trace(volume);
		trace(sndDrum.volume);
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.color = Color.Cyan;
		graphics.fillRect(128, 128, volume * 6, 128);
		btnDown.render(graphics);
		btnUp.render(graphics);
		graphics.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		if (button == 0){
			btnDown.onButtonDown(x, y);
			btnUp.onButtonDown(x, y);
		}
	}

	public function onMouseUp(button:Int, x:Int, y:Int):Void {
		if (button == 0){
			btnDown.onButtonUp(x, y);
			btnUp.onButtonUp(x, y);
		}
	}

	public function volumeDown(){
		sndDrum.volume -= 0.05;
		volume -= 5;
	}

	public function volumeUp(){
		sndDrum.volume += 0.05;
		volume += 5;
	}
}
