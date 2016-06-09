package;

import kha.Framebuffer;
import kha.math.FastMatrix3;

class Project {
	public var angle:Float;
	public var angleSpeed = 0.01;
	
	public var WIDTH = 800;
	public var HEIGHT = 600;
	
	public function new() {
		
	}

	public function update():Void {
		angle += angleSpeed;
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.transformation = FastMatrix3.translation(200, 200);
		graphics.rotate(angle, WIDTH / 2, HEIGHT / 2);
		graphics.fillRect(WIDTH / 2 - 16, HEIGHT / 2 - 16, 32, 32);
		graphics.end();
	}
}
