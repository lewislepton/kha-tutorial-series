package;

import kha.Framebuffer;
import kha.input.Mouse;
import kha.Color;

import Button;

class Project {
	public var uiButton:Button;
	
	public function new() {
		uiButton = new Button(100, 100, 128, 256, Color.Pink);
		Mouse.get().notify(onMouseDown, null, null, null);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		uiButton.render(graphics);
		graphics.end();
	}
	
	public function onMouseDown(button:Int, x:Int, y:Int){
		uiButton.onMouseDown(button, x, y);
	}
}
