import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import Entity;

class Player extends Entity {
	public var size:Float;
	public var speed = 3.00;
	public var up:Bool;
	public var down:Bool;
	public var left:Bool;
	public var right:Bool;

	public function new(x:Float, y:Float, size:Float){
		super(x, y, size, size);
		this.size = size;
	}

	public function update(){
		if (left){
			this.x -= Math.round(speed);
		} else if (right){
			this.x += Math.round(speed);
		}
		
		if (up){
			this.y -= Math.round(speed);
		} else if (down){
			this.y += Math.round(speed);
		}
	}

	public function render(graphics:Graphics){
		graphics.color = Color.Pink;
		graphics.fillCircle(x, y, size);
		graphics.drawCircle(x, y, 320);
	}
}