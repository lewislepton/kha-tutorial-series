package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Mouse;

import Player;

class Project {
	var player:Player;
	public function new() {
		player = new Player(300, 300);
		Mouse.get().notify(null, null, onMouseMove, null);
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

	public function onMouseMove(x:Int, y:Int, mx:Int, my:Int):Void {
		player.x = x;
		player.y = y;
	}
}
