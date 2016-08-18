package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;

import kha2d.Scene;

import Char;

class Project {
	public var char:Char;

	public function new() {
		char = new Char();
		char.x = 350;
		char.y = 250;

		Scene.the.addHero(char);
	}

	public function update():Void {
		Scene.the.update();
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		Scene.the.render(graphics);
		graphics.end();
	}
}
