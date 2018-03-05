package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;

import ImageObject;
import TextObject;
import ShapeObject;

class Project {
	var text:TextObject;
	var object:ShapeObject;
	var image:ImageObject;

	public function new(){
		text = new TextObject('hello i am text', 512, 128, 32);
		object = new ShapeObject(256, 256, 160, 96);
		image = new ImageObject(Assets.images.player, 512, 512);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		for (i in 0 ... 32){
			for (j in 0 ... 32){
				graphics.color = Color.Red;
				graphics.drawLine(i * 128, 0, i * 128, Main.HEIGHT);
				graphics.drawLine(0, j * 128, Main.WIDTH, j * 128);
			}
		}
		text.render(graphics);
		object.render(graphics);
		image.render(graphics);
		graphics.end();
	}
}
