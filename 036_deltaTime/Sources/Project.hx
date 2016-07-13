package;

import kha.Framebuffer;

import Timer;

class Project {
	public var timer:Timer;
	
	public function new() {
		timer = new Timer();
	}

	public function update():Void {
		timer.update();
	}

	public function render(framebuffer:Framebuffer):Void {
		trace(timer.delta);
		trace(timer.current);
	}
}
