package;

import kha.Framebuffer;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import nape.space.Space;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Circle;
import nape.shape.Polygon;

class Project {
	public var space:Space;
	public var circleBody:Body;
	public var circleShape:Circle;
	public var rectBody:Body;
	public var rectShape:Polygon;

	public function new() {
		space = new Space(new Vec2(0, 300));

		circleBody = new Body();
		circleShape = new Circle(64);
		circleShape.body = circleBody;
		circleShape.body.position.setxy(256, 64);
		circleBody.shapes.add(circleShape);
		circleBody.space = space;

		rectBody = new Body(BodyType.STATIC);
		rectShape = new Polygon(Polygon.box(1024, 32));
		rectShape.body = rectBody;
		rectShape.body.position.setxy(0, 512);
		rectBody.shapes.add(rectShape);
		rectBody.space = space;
	}

	public function update():Void {
		space.step(1 / 60);
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.drawCircle(circleShape.body.position.x, circleShape.body.position.y, circleShape.radius);
		graphics.drawRect(rectShape.body.position.x, rectShape.body.position.y, 1024, 32);
		graphics.end();
	}
}
