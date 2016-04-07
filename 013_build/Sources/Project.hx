package;

import kha.Framebuffer;

class Project {
	public function new() {
		
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.fillRect(32, 32, 128, 128);
		graphics.end();
	}
}
