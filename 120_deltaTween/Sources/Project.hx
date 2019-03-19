package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;

import tween.Delta;
import tween.easing.Sine;

import Brick;

class Project {
	var brick:Brick;

	public function new(){
		brick = new Brick(0, 0);

		Delta.tween(brick).prop('x', 600, 2.0).ease(Sine.easeInOut).onComplete(moveY);
	}

	public function update():Void {
		Delta.step(1 / 60);
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		brick.render(graphics);
		graphics.end();
	}

	public function moveY(){
		Delta.tween(brick).propMultiple({x:128, y:300}, 2.0).ease(Sine.easeInOut);
	}
}