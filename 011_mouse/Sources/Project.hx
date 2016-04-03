package;

import kha.Framebuffer;
import kha.input.Mouse;

class Project {
	public function new() {
		Mouse.get().notify(null, null, onMouseMove, null);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		
	}
	
	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		trace('mouse button is DOWN');
		
		if (button == 0){
			trace('LEFT mouse button pressed');
		}
		if (button == 1){
			trace('RIGHT mouse button clicked');
		}
	}
	
	public function onMouseUp(button:Int, x:Int, y:Int):Void {
		trace('mouse button is UP');
		
		if (button == 0){
			trace('LEFT mouse button not pressed');
		}
		if (button == 1){
			trace('RIGHT mouse button not clicked');
		}
	}
	
	public function onMouseMove(x:Int, y:Int, cx:Int, cy:Int):Void {
		if (x > 0){
			trace('x pos ' + x);
		}
		if (y > 0){
			trace('y pos ' + y);
		}
		
		if (cx > 0){
			trace('cx pos ' + cx);
		}
		
		if (cy > 0){
			trace('cy pos ' + cy);
		}
	}
}
