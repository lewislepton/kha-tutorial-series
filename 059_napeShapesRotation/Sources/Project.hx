package;

import kha.Framebuffer;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import nape.space.Space;
import nape.geom.Vec2;

import CircleShape;
import RectShape01;
import RectShape02;

class Project {
	public var space:Space;
	public var circle:CircleShape;
	public var rect01:RectShape01;
	public var rect02:RectShape02;

	public function new() {
		space = new Space(new Vec2(0, 300));
		circle = new CircleShape(space);
		rect01 = new RectShape01(space);
		rect02 = new RectShape02(space);
	}

	public function update():Void {
		space.step(1 / 60);
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		circle.render(graphics);
		rect01.render(graphics);
		rect02.render(graphics);
		graphics.end();
	}
}
