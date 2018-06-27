package;

import kha.Framebuffer;
import kha.graphics2.Graphics;
import kha.Color;
import kha.audio1.Audio;
import kha.audio1.AudioChannel;
import kha.Assets;

import zui.Zui;
import zui.Id;

class Project {
	public var WIDTH = 800;
	public var HEIGHT = 600;

	public var ui:Zui;

	public var playThunder = false;
	public var thunderSound:AudioChannel;
	public var thunderPos:Float;

	public var playRain = false;
	public var rainSound:AudioChannel;
	public var rainPos:Float;

	public var playFire = false;
	public var fireSound:AudioChannel;
	public var firePos:Float;

	public function new() {
		ui = new Zui({font: Assets.fonts.quicksand});

		thunderSound = Audio.play(Assets.sounds.thunder, true);
		thunderSound.pause();
		rainSound = Audio.play(Assets.sounds.rain, true);
		rainSound.pause();
		fireSound = Audio.play(Assets.sounds.fireplace, true);
		fireSound.pause();
	}

	public function update():Void {
		thunderPos = thunderSound.position;
		rainPos = rainSound.position;
		firePos = fireSound.position;
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		soundGraphic(graphics);
		graphics.end();
		gui(graphics);
		toggleStates();
	}

	public function gui(graphics:Graphics){
		ui.begin(graphics);
		if (ui.window(Id.handle(), 0, 0, 200, HEIGHT)){
			if (ui.panel(Id.handle(), 'thunder', 1 , true)){
				thunderSound.volume = ui.slider(Id.handle(), 'volume', 0.0, 1.0, true);
				playThunder = ui.check(Id.handle(), 'off/on');
			}

			if (ui.panel(Id.handle(), 'rain', 1 , true)){
				rainSound.volume = ui.slider(Id.handle(), 'volume', 0.0, 1.0, true);
				playRain = ui.check(Id.handle(), 'off/on');
			}

			if (ui.panel(Id.handle(), 'fire', 1 , true)){
				fireSound.volume = ui.slider(Id.handle(), 'volume', 0.0, 1.0, true);
				playFire = ui.check(Id.handle(), 'off/on');
			}
		}
		ui.end();
	}

	public function soundGraphic(graphics:Graphics){
		graphics.color = Color.fromBytes(108, 109, 255);
		graphics.fillRect(200, 0, 100, thunderPos * 32);
		graphics.color = Color.fromBytes(129, 226, 255);
		graphics.fillRect(300, 0, 100, rainPos * 32);
		graphics.color = Color.fromBytes(255, 55, 48);
		graphics.fillRect(400, 0, 100, firePos * 32);
	}

	public function toggleStates(){
		if (playThunder == true) thunderSound.play();
		else if (playThunder == false) thunderSound.pause();

		if (playRain == true) rainSound.play();
		else if (playRain == false) rainSound.pause();

		if (playFire == true) fireSound.play();
		else if (playFire == false) fireSound.pause();
	}
}
