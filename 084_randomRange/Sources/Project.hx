package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Keyboard;
import kha.input.KeyCode;

class Project {
	var x:Float = 0;
	var y:Float = 0;

	public function new(){
		Keyboard.get().notify(onKeyDown, null);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.color = Color.Pink;
		graphics.fillRect(x, y, 30, 30);
		graphics.end();
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.Space: moveEntity();
		default: return;
		}
	}

	public function randomRangeFloat(min:Float, max:Float):Float {
		return Math.floor(Math.random() * (1 + max - min)) + min;
	}

	public function moveEntity(){
		x = randomRangeFloat(0, 900);
		y = randomRangeFloat(0, 600);
	}
}
