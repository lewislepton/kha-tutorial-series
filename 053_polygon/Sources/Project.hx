package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
using kha.graphics2.GraphicsExtension;
import kha.math.Vector2;

class Project {
	public function new() {
		
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.fillPolygon(30, 60, [new Vector2(300, 0), new Vector2(200, 300), new Vector2(400, 300)]);
		graphics.end();
	}
}
