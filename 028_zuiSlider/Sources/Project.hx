package;

import kha.Framebuffer;
import kha.Assets;
import kha.graphics2.Graphics;

import zui.Zui;
import zui.Id;

import Block;

class Project {
	public var ui:Zui;
	public var block:Block;
	
	public function new() {
		ui = new Zui(Assets.fonts.Abel_Regular, 64);
		block = new Block();
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		block.render(graphics);
		graphics.end();
		gui(graphics);
	}
	
	public function gui(graphics:Graphics){
		ui.begin(graphics);
		if (ui.window(Id.window(), 0, 0, 300, 300)){
			if (ui.node(Id.node(), 'NODE', 0, true)){
				block.x = ui.slider(Id.slider(), 'X', 0, 300, false, 1);
				block.y = ui.slider(Id.slider(), 'Y', 0, 300, false, 1);
				block.width = ui.slider(Id.slider(), 'WIDTH', 0, 300, false, 1);
				block.height = ui.slider(Id.slider(), 'HEIGHT', 0, 300, false, 1);
			}
		}
		ui.end();
	}
}
