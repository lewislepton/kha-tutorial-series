package lkl.ui;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.Font;

import lkl.Entity;

class Text extends Entity {
	public var font:Font;
	public var string:String;
	public var color:Color = Color.White;

	public var size:Int;

	public function new(font:Font, string:String, ?x:Float = 0, ?y:Float = 0, ?size:Int = 16){
		this.font = font;
		this.string = string;
		this.size = size;

		super(x, y, font.width(size, string), font.height(size));
	}

	override public function update(){
		super.update();
	}

	override public function render(graphics:Graphics){
		super.render(graphics);
		graphics.color = color;
		graphics.font = font;
		graphics.fontSize = size;
		graphics.drawString(string, position.x, position.y);
	}
}