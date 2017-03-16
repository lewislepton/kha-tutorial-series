package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;

import Player;

class Project {
	public var player:Player;
	public function new() {
		player = new Player();
		player.width = 512;
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		player.render(graphics);
		graphics.end();
	}
}
