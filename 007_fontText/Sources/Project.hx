package;

import kha.Framebuffer;
import kha.Font;
import kha.Assets;

class Project {
	// public var font:Font;
	
	public function new() {
		// font = Assets.fonts.OpenSans;		
	}

	public function update():Void {		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		
		// graphics.font = font;
		graphics.font = Assets.fonts.OpenSans;
		graphics.fontSize = 128;
		graphics.drawString('some text', 32, 128);
		
		graphics.end();		
	}
}
