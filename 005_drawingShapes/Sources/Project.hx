package;

import kha.Framebuffer;
import kha.Color;
using kha.graphics2.GraphicsExtension;

class Project {
	public function new() {		
	}

	public function update():Void {		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		
		graphics.color = Color.Pink;
		graphics.drawRect(32, 32, 64, 32, 6);
		
		graphics.fillRect(128, 32, 64, 64);
		
		graphics.color = Color.Green;
		graphics.drawLine(32, 128, 512, 32, 6);
		
		graphics.drawCircle(256, 256, 50, 5);
		
		graphics.end();
	}
}
