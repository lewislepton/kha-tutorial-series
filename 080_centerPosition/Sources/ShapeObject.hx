import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import Entity;

class ShapeObject extends Entity {
	public function new(x:Float, y:Float, width:Float, height:Float){
		super(x, y, width, height);
	}

	public function update(){
		
	}

	public function render(graphics:Graphics){
		graphics.color = Color.Cyan;
		graphics.fillRect(x, y, width, height);
	}
}