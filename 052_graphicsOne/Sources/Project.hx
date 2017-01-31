package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;

class Project {
	public function new() {
		
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g1;
		graphics.begin();
		graphics.setPixel(128, 128, Color.Pink);
		graphics.end();
	}
}