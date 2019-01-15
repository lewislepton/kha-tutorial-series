import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;

import lkl.Entity;

import Gun;

class Player extends Entity {
	public var left:Bool;
	public var right:Bool;
	public var rightLook:Bool;
	public var gun:Gun;

	public function new(x:Float, y:Float){
		super(x, y, 64, 64);
		gun = new Gun(x, y);
	}

	override public function update(){
		super.update();

		gun.update();

		if (left){
			this.position.x -= Math.round(speed);
			rightLook = false;
		} else if (right){
			this.position.x += Math.round(speed);
			rightLook = true;
		}
	}

	override public function render(graphics:Graphics){
		super.render(graphics);
		graphics.color = Color.Pink;
		graphics.fillRect(position.x, position.y, width, height);
		gun.render(graphics);
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		switch (keyCode){
			case Left: left = true;
			case Right: right = true;
			case Space: gun.create(position.x + width / 2, position.y + height / 2, rightLook);
		default: return;
		}
	}

	public function onKeyUp(keyCode:KeyCode):Void {
		switch (keyCode){
			case Left: left = false;
			case Right: right = false;
		default: return;
		}
	}
}