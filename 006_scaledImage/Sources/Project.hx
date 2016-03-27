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
		
		graphics.drawScaledImage(image, 30, 30, 128, 32);
		
		graphics.drawScaledImage(Assets.images.PixelMeComputer, 256, 32, 256, 64);
		
		graphics.end();
	}
}
