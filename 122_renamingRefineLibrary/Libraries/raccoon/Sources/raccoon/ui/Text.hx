package raccoon.ui;

import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.Font;

import raccoon.Entity;

class Text extends Entity {
	public var font:Font;
	public var string:String;
	public var color:Color = Color.White;

	public var size:Int;

	public function new(fontname:String, string:String, ?x:Float = 0, ?y:Float = 0, ?size:Int = 16){
		this.font = Reflect.field(Assets.fonts, fontname);
		this.string = string;
		this.size = size;

		super(x, y, font.width(size, string), font.height(size));
	}

	override public function update(){
		super.update();
	}

	override public function render(canvas:Canvas){
		super.render(canvas);
		canvas.g2.color = color;
		canvas.g2.font = font;
		canvas.g2.fontSize = size;
		canvas.g2.drawString(string, position.x, position.y);
	}

	public function set(fontname:String){
		this.font = Reflect.field(Assets.fonts, fontname);
	}
}