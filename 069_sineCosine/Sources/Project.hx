package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.Scheduler;
import kha.math.FastMatrix3;
import kha.input.KeyCode;
import kha.input.Keyboard;

class Project {
	var x:Float;
	var y:Float;
	var xCon:Float;
	var yCon:Float;
	
	public function new() {
		Keyboard.get().notify(onKeyDown, null);
	}

	public function update():Void {
		x = Math.sin(Scheduler.time() * 3.9) * xCon;
		y = Math.cos(Scheduler.time() * 2.6) * yCon;
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.pushTransformation(FastMatrix3.translation(1024 / 2, 768 / 2));
		graphics.color = Color.Pink;
		graphics.fillRect(x, y, 64, 64);
		graphics.popTransformation();
		graphics.end();
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.Up: yCon += 10;
			case KeyCode.Left: xCon += 10;
		default: return;
		}
	}
}
