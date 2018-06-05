package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Mouse;

class Project {
	var x:Float;
	var y:Float;
	var mouseX:Float;
	var mouseY:Float;
	var easing = 0.006;

	public function new(){
		Mouse.get().notify(null, null, onMouseMove, null);
	}

	public function update():Void {
		ease();
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.color = Color.Pink;
		graphics.fillRect(x, y, 30, 30);
		graphics.end();
	}

	public function onMouseMove(x:Int, y:Int, mx:Int, my:Int):Void {
		mouseX = x;
		mouseY = y;
	}

	public function ease(){
		var dx = mouseX - x;
		x += dx * easing;

		var dy = mouseY - y;
		y += dy * easing;
	}
}
