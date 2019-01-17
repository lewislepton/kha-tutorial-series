import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import lkl.Entity;

class Enemy extends Entity {
	public function new(x:Float, y:Float){
		super(x, y, 64, 64);
	}

	override public function update(){
		super.update();
	}

	override public function render(graphics:Graphics){
		super.render(graphics);
		graphics.color = Color.Red;
		graphics.fillRect(position.x, position.y, width, height);
	}
}