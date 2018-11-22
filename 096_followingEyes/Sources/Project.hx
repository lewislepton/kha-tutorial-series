package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Mouse;
import kha.Image;

import Eye;

class Project {
	var imgHead:Image;
	var mouseX:Float;
	var mouseY:Float;
	var arEye:Array<Eye>;

	public function new(){
		imgHead = Assets.images.head;

		arEye = [];

		Mouse.get().notify(onMouseDown, null, onMouseMove, null);
	}

	public function update():Void {
		for (eye in arEye){
			eye.update(mouseX, mouseY);
		}
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin(true, Color.fromFloats(0.7, 0.9, 1, 1));
		graphics.color = Color.White;
		graphics.drawImage(imgHead, 0, 0);
		for (eye in arEye){
			eye.render(graphics);
		}
		graphics.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		if (button == 0){
			create(x, y);
		} else if (button == 1){
			delete();
		}
	}

	public function onMouseMove(x:Int, y:Int, mx:Int, my:Int):Void {
		mouseX = x;
		mouseY = y;
	}

	public function create(?x:Float = 0, ?y:Float = 0){
		for (eye in arEye){
			if (!eye.active){
				eye.activate(x, y);
				return;
			}
		}
		arEye.push(new Eye(x, y));
	}

	public function delete(){
		var eye = arEye.length;
		while (eye -- > 0){
			arEye.splice(eye, 1);
		}
	}
}
