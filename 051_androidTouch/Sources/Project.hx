package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Surface;

import Rect;

class Project {
	public var rect01:Rect;
	public var rect02:Rect;
	public function new() {
		rect01 = new Rect();
		rect02 = new Rect();
		Surface.get().notify(onTouchDown, onTouchUp, onTouchMove);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.color = Color.Cyan;
		rect01.render(graphics);
		graphics.color = Color.Pink;
		rect02.render(graphics);
		graphics.end();
	}

	public function onTouchDown(id:Int, x:Int, y:Int){
		if (id == 0){
			trace('FIRST FINGER DOWN');
		}
		if (id == 1){
			trace('SECOND FINGER DOWN');
		}
	}

	public function onTouchUp(id:Int, x:Int, y:Int){
		if (id == 0){
			trace('FIRST FINGER UP');
		}
		if (id == 1){
			trace('SECOND FINGER UP');
		}
	}

	public function onTouchMove(id:Int, x:Int, y:Int){
		if (id == 0){
			if (x > 0){
				trace('FIRST FINGER MOVE X');
				rect01.x = x;
			}
			if (y > 0){
				trace('FIRST FINGER MOVE Y');
				rect01.y = y;
			}
		}

		if (id == 1){
			if (x > 0){
				trace('SECOND FINGER MOVE X');
				rect02.x = x;
			}
			if (y > 0){
				trace('SECOND FINGER MOVE Y');
				rect02.y = y;
			}
		}
	}
}
