package state;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import Button;

class Blue {
	public var button:Button;
	public function new(){
		button = new Button(0, 512, 128, 32, Color.Red);
	}

	public function update(){
		
	}

	public function render(graphics:Graphics){
		graphics.color = Color.Blue;
		graphics.fillCircle(256, 256, 128, 128);
		button.render(graphics);
	}
}