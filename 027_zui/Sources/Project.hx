package;

import kha.Framebuffer;
import kha.Assets;
import kha.graphics2.Graphics;

import zui.Zui;
import zui.Id;

class Project {
	public var ui:Zui;
	
	public function new() {
		ui = new Zui(Assets.fonts.Abel_Regular, 64);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.end();
		gui(graphics);
	}
	
	public function gui(graphics:Graphics){
		ui.begin(graphics);
		if (ui.window(Id.window(), 0, 0, 300, 300)){
			if (ui.node(Id.node(), 'NODE', 0, true)){
				ui.slider(Id.slider(), 'SLIDER',0, 300, false, 0.6);
				ui.button('BUTTON');
				ui.check(Id.check(), 'CHECK');
				ui.text('TEXT', 1);
			}
		}
		ui.end();
	}
}
