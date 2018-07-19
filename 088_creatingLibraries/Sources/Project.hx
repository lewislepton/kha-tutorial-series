package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;

import lkl.Printer;

class Project {
	public function new(){
		var print = new Printer();
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		
		graphics.end();
	}
}
