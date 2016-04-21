package;

import kha.Framebuffer;
import kha.math.FastMatrix3;

import Block;

class Project {
	public var block:Block;
	public function new() {
		block = new Block();
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.transformation = FastMatrix3.translation(400, 300);
		block.render(graphics);
		graphics.end();
	}
}
