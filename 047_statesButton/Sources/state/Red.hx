package state;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import Button;

class Red {
	public var button:Button;
	public function new(){
		button = new Button(512, 512, 128, 32, Color.Blue);
	}

	public function update(){
		
	}

	public function render(graphics:Graphics){
		graphics.color = Color.Red;
		graphics.fillCircle(128, 128, 128, 128);
		button.render(graphics);
	}
}