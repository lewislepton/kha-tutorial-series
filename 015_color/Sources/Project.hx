package;

import kha.Framebuffer;

import Block01;
import Block02;

class Project {
	public var block01:Block01;
	public var block02:Block02;
	public function new() {
		block01 = new Block01();
		block02 = new Block02();
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		block01.render(graphics);
		block02.render(graphics);
		graphics.end();
	}
}
