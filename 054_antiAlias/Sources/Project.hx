package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
using kha.graphics2.GraphicsExtension;

class Project {
	public function new() {
		
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.drawCircle(0, 0, 512);
		graphics.end();
	}
}
