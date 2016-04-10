package;

import kha.Framebuffer;

import char.Rect;

class Project {
	public var rect:Rect;
	
	public function new() {
		rect = new Rect();
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		rect.render(graphics);
		graphics.end();
	}
}
