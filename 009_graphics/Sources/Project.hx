package;

import kha.Framebuffer;
import kha.graphics2.Graphics;

class Project {
	public function new() {
		
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		drawGraphics(graphics);
		graphics.end();
	}
	
	public function drawGraphics(graphics:Graphics):Void {
		graphics.drawRect(32, 32, 64, 128);
	}
}
