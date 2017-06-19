import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.Image;
import kha.input.KeyCode;

import nape.space.Space;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Polygon;
import nape.phys.Material;

class RectShape02 {
	public var body:Body;
	public var shape:Polygon;
	public var width = 64;
	public var height = 64;
	public var image:Image;

	public var left:Bool;
	public var right:Bool;
	public var up:Bool;
	public var down:Bool;
	public var leftRotate:Bool;
	public var rightRotate:Bool;

	public function new(space:Space){
		image = Assets.images.rect;
		body = new Body();
		shape = new Polygon(Polygon.box(width, height));
		shape.body = body;
		shape.body.position.setxy(254, -100);
		body.setShapeMaterials(Material.glass());
		body.shapes.add(shape);
		body.space = space;
	}

	public function update(){
		if (left){
			body.applyImpulse(new Vec2(-9, 0));
		} else if (right){
			body.applyImpulse(new Vec2(9, 0));
		}

		if (up){
			body.applyImpulse(new Vec2(0, -9));
		} else if (down){
			body.applyImpulse(new Vec2(0, 9));
		}

		if (leftRotate){
			body.applyAngularImpulse(-30);
		} else if (rightRotate){
			body.applyAngularImpulse(30);
		}
	}

	public function render(graphics:Graphics){
		var pos:Vec2;
		pos = body.position;
		graphics.pushRotation(body.rotation, pos.x, pos.y);
		graphics.drawImage(image, shape.body.position.x - width / 2, shape.body.position.y - height / 2);
		graphics.drawRect(shape.body.position.x - width / 2, shape.body.position.y - height / 2, width, height);
		graphics.popTransformation();
	}

	public function onKeyDown(keyCode:Int){
		switch (keyCode){
			case KeyCode.Up: up = true;
			case KeyCode.Down: down = true;
			case KeyCode.Left: left = true;
			case KeyCode.Right: right = true;
			case KeyCode.Q: leftRotate = true;
			case KeyCode.J: rightRotate = true;
		default: return;
		}
	}
	
	public function onKeyUp(keyCode:Int){
		switch (keyCode){
			case KeyCode.Up: up = false;
			case KeyCode.Down: down = false;
			case KeyCode.Left: left = false;
			case KeyCode.Right: right = false;
			case KeyCode.Q: leftRotate = false;
			case KeyCode.J: rightRotate = false;
		default: return;
		}
	}
}