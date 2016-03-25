package;

import kha.Framebuffer;
import kha.Image;
import kha.Assets;

class Project {
	public var image:Image;
	
	public function new() {
		image = Assets.images.PixelMeComputer;
	}

	public function update():Void {		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.drawImage(image, 30, 30);
		graphics.end();
	}
}
