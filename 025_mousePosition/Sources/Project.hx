package;

import kha.Framebuffer;
import kha.input.Mouse;

import Block;

class Project {
	public var block:Block;
	
	public function new() {
		block = new Block();
		Mouse.get().notify(null, null, onMouseMove, null);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		block.render(graphics);
		graphics.end();
	}
	
	public function onMouseMove(x:Int, y:Int, cx:Int, cy:Int){
		if (x > 0){
			block.x = x;
		}
		if (y > 0){
			block.y = y;
		}
	}
}
