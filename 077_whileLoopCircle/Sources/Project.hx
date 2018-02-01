package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
using kha.graphics2.GraphicsExtension;

class Project {
	public function new(){
		
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		var radius = 0;
		var total = 300;
		var step = 10;
		while (radius < total){
			graphics.drawCircle(Main.WIDTH / 2, Main.HEIGHT / 2, radius);
			radius += step;
		}
		graphics.end();
	}
}
