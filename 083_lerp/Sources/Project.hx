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

	public function new(){
		Mouse.get().notify(null, null, onMouseMove, null);
	}

	public function update():Void {
		x = lerp(x, mouseX, 0.06);
		y = lerp(y, mouseY, 0.06);
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

	public function lerp(min:Float, max:Float, value:Float):Float {
		return min + (max - min) * value;
	}
}
