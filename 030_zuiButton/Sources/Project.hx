package;

import kha.Framebuffer;
import kha.Assets;
import kha.graphics2.Graphics;
import kha.Color;

import zui.Zui;
import zui.Id;

class Project {
	public var ui:Zui;
	public var button:Bool;
	
	public function new() {
		ui = new Zui({font:Assets.fonts.arial});
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		
		if (button){
			trace('BUTTON HAS BEEN PRESSED');
		}
		
		graphics.end();
		gui(graphics);
	}
	
	public function gui(graphics:Graphics){
		ui.begin(graphics);
		if (ui.window(Id.handle(), 0, 0, 300, 300)){
			if (ui.panel(Id.handle(), 'node', 0, true)){
				button = ui.button('BUTTON');
			}
		}
		ui.end();
	}
}
