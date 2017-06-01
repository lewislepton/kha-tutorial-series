import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import nape.space.Space;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Polygon;

class RectShape01 {
	public var body:Body;
	public var shape:Polygon;
	public var width = 1024;
	public var height = 32;

	public function new(space:Space){
		body = new Body();
		body.allowRotation = false;
		body.allowMovement = false;
		shape = new Polygon(Polygon.box(width, height));
		shape.body = body;
		shape.body.position.setxy(512, 256);
		body.shapes.add(shape);
		body.space = space;
		body.rotate(new Vec2(0, 0), 0.336);
	}

	public function update(){
		
	}

	public function render(graphics:Graphics){
		var pos:Vec2;
		pos = body.position;
		graphics.pushRotation(body.rotation, pos.x, pos.y);
		graphics.drawRect(shape.body.position.x - width / 2, shape.body.position.y - height / 2, width, height);
		graphics.popTransformation();
	}
}