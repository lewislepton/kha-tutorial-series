import kha.graphics2.Graphics;
import kha.Color;
import kha.Image;
import kha.Assets;

import Entity;

class ImageObject extends Entity {
	var image:Image;

	public function new(image:Image, x:Float, y:Float){
		this.image = image;
		super(x, y, image.width, image.height);
	}

	public function update(){
		
	}

	public function render(graphics:Graphics){
		graphics.color = Color.White;
		graphics.drawImage(image, x, y);
	}
}