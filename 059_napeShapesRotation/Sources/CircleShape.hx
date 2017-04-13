import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import nape.space.Space;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.shape.Circle;

class CircleShape {
	public var body:Body;
	public var shape:Circle;
	public var size = 64;

	public function new(space:Space){
		body = new Body();
		shape = new Circle(size);
		shape.body = body;
		shape.body.position.setxy(256, 64);
		body.shapes.add(shape);
		body.space = space;
	}

	public function update(){
		
	}

	public function render(graphics:Graphics){
		var pos:Vec2;
		pos = body.position;
		graphics.pushRotation(body.rotation, pos.x, pos.y);
		graphics.drawCircle(shape.body.position.x, shape.body.position.y, size);
		graphics.popTransformation();
	}
}