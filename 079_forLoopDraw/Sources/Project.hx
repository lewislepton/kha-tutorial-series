package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.Scheduler;
import kha.math.FastMatrix3;

class Project {
	var nPoint = 9;
	var x:Float;
	var y:Float;
	public function new(){
		
	}

	public function update():Void {
		x = Math.sin(Scheduler.time() * 3.36) * 2.3;
		y = Math.cos(Scheduler.time() * 3.6) * 3.0;
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		for (e in 0 ... 32){
			graphics.color = Color.Magenta;
			graphics.fillRect(e * 32, 0, 24, 64);
		}

		for (j in 0 ... 32){
			for (k in 0 ... 32){
				graphics.color = Color.Pink;
				graphics.drawLine(j * 32, 0, j * 32, Main.HEIGHT);
				graphics.drawLine(0, k * 32, Main.WIDTH, k * 32);
			}
		}

		graphics.pushTransformation(FastMatrix3.translation(Main.WIDTH / 2, Main.HEIGHT / 2));
		for (i in 0 ... nPoint){
			graphics.color = Color.Red;
			graphics.fillRect(x * i * 16, y * i * 16, 32, 32);
		}
		graphics.popTransformation();
		graphics.end();
	}
}
