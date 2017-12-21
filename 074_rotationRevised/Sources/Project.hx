package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.math.FastMatrix3;

class Project {
	public var angle:Float;
	public var angleSpeed = 0.9;
	
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
		graphics.pushTransformation(FastMatrix3.translation(WIDTH / 2, HEIGHT / 2));
		graphics.rotate(radToDeg(angle), WIDTH / 2, HEIGHT / 2);
		graphics.fillRect(-16, -16, 32, 32);
		graphics.popTransformation();
		graphics.end();
	}

	public function degToRad(degrees:Float):Float {
		return degrees * Math.PI / 180;
	}

	public function radToDeg(radians:Float):Float {
		return radians * 180 / Math.PI;
	}
}