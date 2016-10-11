package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Mouse;

import Rectangle;

class Project {
	public var rect01:Rectangle;
	public var rect02:Rectangle;
	public function new() {
		rect01 = new Rectangle(512, 512, 256, 256);
		rect02 = new Rectangle(0, 0, 128, 128);
		Mouse.get().notify(null, null, onMouseMove, null);
	}

	public function update():Void {
		if (rect01.overlap(rect02)){
			trace('OVERLAPPED');
		}
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.color = Color.Cyan;
		graphics.fillRect(rect01.x, rect01.y, rect01.width, rect01.height);

		graphics.color = Color.Pink;
		graphics.fillRect(rect02.x, rect02.y, rect02.width, rect02.height);
		graphics.end();
	}

	public function onMouseMove(x:Int, y:Int, cx:Int, cy:Int){
		rect02.x = x;
		rect02.y = y;
	}
}
