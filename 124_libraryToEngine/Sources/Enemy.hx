import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import raccoon.Entity;

class Enemy extends Entity {
	public function new(x:Float, y:Float){
		super(x, y, 64, 64);
	}

	override public function update(){
		super.update();
	}

	override public function render(canvas:Canvas){
		super.render(canvas);
		if (invincible){
			canvas.g2.color = Color.Cyan;
		} else {
			canvas.g2.color = Color.Red;
		}
		canvas.g2.fillRect(position.x, position.y, width, height);
	}
}