package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.graphics2.Graphics;

import zui.Zui;
import zui.Id;
import zui.Ext;

class Project {
	var ui:Zui;

	public function new(){
		ui = new Zui({font:Assets.fonts.arial});
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
		if (ui.window(Id.handle(), 10, 10, 240, 600, true)){
			if (ui.panel(Id.handle({selected:true}), 'panel')){
				ui.text('this is text');
				ui.textInput(Id.handle({text: 'we can put text in here'}), 'text input');
				ui.check(Id.handle(), 'checkbox');
				ui.slider(Id.handle({value: 0.3}), 'slider', 0, 2);
				Ext.colorPicker(ui, Id.handle());
			}
		}
		ui.end();
	}
}
