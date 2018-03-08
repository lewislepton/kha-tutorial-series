import kha.graphics2.Graphics;
import kha.Color;
import kha.Image;
import kha.Assets;

import Entity;

class Player extends Entity {
	var image:Image;

	public function new(image:Image, x:Float, y:Float){
		this.image = image;
		super(x, y, image.width, image.height);
	}

	public function update(){
		this.y += Math.round(3);
	}

	public function render(graphics:Graphics){
		graphics.color = Color.White;
		graphics.drawImage(image, x, y);
	}
}