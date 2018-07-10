package;

import kha.Framebuffer;
import kha.Assets;
import kha.graphics2.Graphics;
import kha.Color;

import zui.Zui;
import zui.Id;

import Block;

class Project {
	public var ui:Zui;
	public var button:Bool;
	public var toggle:Bool;
	
	public var radio01:Bool;
	public var radio02:Bool;
	public var radio03:Bool;
	
	public var block:Block;
	
	public function new() {
		ui = new Zui({font:Assets.fonts.arial});
		block = new Block();
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		
		if (button){
			trace('BUTTON HAS BEEN PRESSED');
		}
		
		if (!toggle){
			block.width = 32;
			block.height = 32;
		} else {
			block.height = 128;
			block.width = 256;
		}
		
		if (radio01){
			block.color = Color.Green;
		} else if (radio02){
			block.color = Color.Red;
		} else if (radio03){
			block.color = Color.Pink;
		}
		
		block.render(graphics);
		
		graphics.end();
		gui(graphics);
	}
	
	public function gui(graphics:Graphics){
		ui.begin(graphics);
		if (ui.window(Id.handle(), 0, 0, 300, 300)){
			if (ui.panel(Id.handle(), 'node', 0, true)){
				button = ui.button('BUTTON');
				toggle = ui.check(Id.handle(), 'size change');
				
				var idRadio = Id.handle();
				radio01 = ui.radio(idRadio, Id.pos(), 'green');
				radio02 = ui.radio(idRadio, Id.pos(), 'red');
				radio03 = ui.radio(idRadio, Id.pos(), 'pink');				
			}
		}
		ui.end();
	}
}
