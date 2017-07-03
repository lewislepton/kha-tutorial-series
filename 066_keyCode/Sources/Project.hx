package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;
import kha.input.Keyboard;

class Project {
	var YES:Bool;
	var NO:Bool;
	public function new() {
		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update():Void {
		if (YES){
			trace('YES');
		} else if (NO){
			trace('NO');
		}
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		
		graphics.end();
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.A: YES = true;
			case KeyCode.P: NO = true;
		default: return;
		}
	}

	public function onKeyUp(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.A: YES = false;
			case KeyCode.P: NO = false;
		default: return;
		}
	}
}