package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;
import kha.input.Keyboard;

import Player;

class Project {
	var player:Player;
	public function new() {
		player = new Player(512, 350);
		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update():Void {
		player.update(1 / 60);

		if (player.x + player.size <= 0){
			player.x = 1024;
		} else if (player.x >= 1024){
			player.x = 0 - player.size;
		}

		if (player.y + player.size <= 0){
			player.y = 768;
		} else if (player.y >= 768){
			player.y = 0 - player.size;
		}
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		player.render(graphics);
		graphics.end();
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		player.onKeyDown(keyCode);
	}

	public function onKeyUp(keyCode:KeyCode):Void {
		player.onKeyUp(keyCode);
	}
}
