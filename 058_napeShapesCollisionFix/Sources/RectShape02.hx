import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import nape.space.Space;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Polygon;

class RectShape02 {
	public var body:Body;
	public var shape:Polygon;
	public var width = 64;
	public var height = 64;

	public function new(space:Space){
		body = new Body();
		shape = new Polygon(Polygon.box(width, height));
		shape.body = body;
		shape.body.position.setxy(254, -100);
		body.shapes.add(shape);
		body.space = space;
	}

	public function update(){
		
	}

	public function render(graphics:Graphics){
		graphics.color = Color.Red;
		graphics.drawRect(shape.body.position.x, shape.body.position.y, width, height);
		
		graphics.color = Color.White;
		graphics.drawRect(shape.body.position.x - width / 2, shape.body.position.y - height / 2, width, height);
	}
}