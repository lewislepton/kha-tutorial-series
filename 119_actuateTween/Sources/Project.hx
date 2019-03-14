package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;

import motion.Actuate;
import motion.easing.Sine;

import Brick;

class Project {
	var brick:Brick;

	public function new(){
		brick = new Brick(0, 0, 64, 64);

		Actuate.tween(brick, 2.0, {x:600}).ease(Sine.easeInOut).repeat(3).onComplete(moveY);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		brick.render(graphics);
		graphics.end();
	}

	public function moveY(){
		Actuate.tween(brick, 2.0, {y: 300}).ease(Sine.easeInOut);
	}
}