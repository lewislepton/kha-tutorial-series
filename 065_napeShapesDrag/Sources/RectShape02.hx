import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.Image;
import kha.Key;

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
		shape.body.position.setxy(254, 200);
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

	public function onKeyDown(key:Key, char:String){
		switch (key){
			case UP: up = true;
			case DOWN: down = true;
			case LEFT: left = true;
			case RIGHT: right = true;
			case CHAR:
				if (char == 'q') leftRotate = true;
				if (char == 'j') rightRotate = true;
		default: return;
		}
	}

	public function onKeyUp(key:Key, char:String){
		switch (key){
			case UP: up = false;
			case DOWN: down = false;
			case LEFT: left = false;
			case RIGHT: right = false;
			case CHAR:
				if (char == 'q') leftRotate = false;
				if (char == 'j') rightRotate = false;
		default: return;
		}
	}
}