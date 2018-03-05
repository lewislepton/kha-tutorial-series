import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.Font;

import Entity;

class TextObject extends Entity {
	var font:Font;
	var text:String;
	var size:Int;

	public function new(text:String, x:Float, y:Float, size:Int){
		font = Assets.fonts.arial;
		super(x, y, font.width(size, text), font.height(size));

		this.size = size;
		this.text = text;
	}

	public function update(){
		
	}

	public function render(graphics:Graphics){
		graphics.color = Color.Pink;
		graphics.font = font;
		graphics.fontSize = size;
		graphics.drawRect(x, y, width, height);
		graphics.drawString(text, x, y);
	}
}