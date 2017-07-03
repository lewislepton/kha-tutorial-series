package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;
import kha.input.Keyboard;

import Player;

class Project {
	public var player:Player;

	public function new() {
		player = new Player();
		player.x = 350;
		player.y = 250;

		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update():Void {
		player.update();
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		player.render(graphics);
		graphics.end();
	}

	public function onKeyDown(keyCode:KeyCode){
		player.onKeyDown(keyCode);
	}

	public function onKeyUp(keyCode:KeyCode){
		player.onKeyUp(keyCode);
	}
}
