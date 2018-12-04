package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
using kha.graphics2.GraphicsExtension;
import kha.Scheduler;

import Loop;

class Project {
	var speed = 6.0;
	var size:Float;

	public function new(){
		size = randomRangeFloat(0, 128);
	}

	public function update():Void {
		size -= Math.sin(Scheduler.time() * speed);
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		for (i in new Loop(0, 128, 8)){
			graphics.drawCircle(Main.WIDTH / 2, Main.HEIGHT / 2, i + size);
		}
		graphics.end();
	}

	public function degToRad(angle:Float):Float {
		return Math.PI / 180 * angle;
	}

	public function randomRangeFloat(min:Float, max:Float):Float {
		return Math.floor(Math.random() * (1 + max - min)) + min;
	}
}