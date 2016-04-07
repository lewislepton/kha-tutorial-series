package;

import kha.Framebuffer;
import kha.input.Gamepad;

class Project {
	public function new() {
		Gamepad.get().notify(onGamepadAxis, onGamepadButton);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		
	}
	
	public function onGamepadAxis(axis:Int, value:Float):Void {
		if (axis == 0){
			if (value < -0.5){
				trace('LEFT LEFT ANALOG');
			} else if (value > 0.5){
				trace('RIGHT LEFT ANALOG');
			}
		}
		
		if (axis == 1){
			if (value > 0.5){
				trace('UP LEFT ANALOG');
			} else if (value < -0.5){
				trace('DOWN LEFT ANALOG');
			}
		}
		
		if (axis == 3){
			if (value > 0.5){
				trace('LEFT RIGHT ANALOG');
			} else if (value < -0.5){
				trace('RIGHT RIGHT ANALOG');
			}
		}
		
		if (axis == 4){
			if (value < -0.5){
				trace('UP RIGHT ANALOG');
			} else if (value > 0.5){
				trace('DOWN RIGHT ANALOG');
			}
		}
		
		if (axis == 2){
			if (value < -0.5){
				trace('LEFT TRIGGER');
			}
		}
		
		if (axis == 5){
			if (value < -0.5){
				trace('RIGHT TRIGGER');
			}
		}
	}
	
	public function onGamepadButton(button:Int, value:Float):Void {
		if (button == 0){
			trace('A');
		} else if (button == 1){
			trace('B');
		} else if (button == 2){
			trace('X');
		} else if (button == 3){
			trace('Y');
		}
		
		if (button == 4){
			trace('LEFT BUMPER');
		}
		if (button == 5){
			trace('RIGHT BUMPER');
		}
		
		if (button == 6){
			trace('LEFT ANALOG PRESS');
		}
		if (button == 7){
			trace('RIGHT ANALOG PRESS');
		}
		
		if (button == 8){
			trace('START');
		}
		if (button == 9){
			trace('BACK');
		}
		if (button == 10){
			trace('HOME');
		}
		
		if (button == 11){
			trace('DPAD UP');
		} else if (button == 12){
			trace('DPAD DOWN');
		} else if (button == 13){
			trace('DPAD LEFT');
		} else if (button == 14){
			trace('DPAD RIGHT');
		}
	}
}
