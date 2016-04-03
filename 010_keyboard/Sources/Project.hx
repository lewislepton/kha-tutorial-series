package;

import kha.Framebuffer;
import kha.Key;
import kha.input.Keyboard;

class Project {
	public function new() {
		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		
	}
	
	public function onKeyDown(key:Key, char:String):Void {
		switch (key){
			case UP: trace('the UP key is pressed');
			case DOWN: trace('the DOWN key is pressed');
			
			case CHAR: if (char == 'a') trace('the A key is pressed');
		default: return;
		}
	}
	
	public function onKeyUp(key:Key, char:String):Void {
		switch (key){
			case UP: trace('the UP key is not pressed');
			case DOWN: trace('the DOWN key is not pressed');
			
			case CHAR: if (char == 'a') trace('the A key is not pressed');
		default: return;
		}
	}
}
