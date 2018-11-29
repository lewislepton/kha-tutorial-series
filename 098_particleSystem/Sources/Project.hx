package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Mouse;

import Emitter;

class Project {
	var emitter:Emitter;

	public function new(){
		emitter = new Emitter(9);

		Mouse.get().notify(onMouseDown, null, null, null);
	}

	public function update():Void {
		emitter.update();
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		emitter.render(graphics);
		graphics.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		if (button == 0){
			emitter.spawn(x, y);
		}
	}
}