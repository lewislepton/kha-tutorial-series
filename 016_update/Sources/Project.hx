package;

import kha.Framebuffer;

import Block;

class Project {
	public var block:Block;
	public function new() {
		block = new Block();
	}

	public function update():Void {
		block.x += 2;
		block.y += 6;
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		block.render(graphics);
		graphics.end();
	}
}
