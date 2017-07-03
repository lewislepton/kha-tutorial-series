package;

import kha.Framebuffer;
import kha.input.KeyCode;
import kha.input.Keyboard;

class Project {
	public function new() {
		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		
	}
	
	public function onKeyDown(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.Up: trace('the UP key is pressed');
			case KeyCode.Down: trace('the DOWN key is pressed');
			case KeyCode.A: trace('the A key is pressed');
		default: return;
		}
	}
	
	public function onKeyUp(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.Up: trace('the UP key is not pressed');
			case KeyCode.Down: trace('the DOWN key is not pressed');
			case KeyCode.A: trace('the A key is not pressed');
		default: return;
		}
	}
}
