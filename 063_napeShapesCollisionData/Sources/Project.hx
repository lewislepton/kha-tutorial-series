package;

import kha.Framebuffer;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import nape.space.Space;
import nape.geom.Vec2;
import nape.callbacks.InteractionListener;
import nape.callbacks.InteractionType;
import nape.callbacks.InteractionCallback;
import nape.callbacks.CbEvent;
import nape.callbacks.CbType;

import RectShape01;
import RectShape02;

class Project {
	public var space:Space;
	public var rect01:RectShape01;
	public var rect02:RectShape02;

	var interactionListener:InteractionListener;
	var rectCollisionType:CbType = new CbType();

	public function new() {
		space = new Space(new Vec2(0, 300));
		interactionListener = new InteractionListener(CbEvent.BEGIN, InteractionType.COLLISION, rectCollisionType, rectCollisionType, colliding);
		space.listeners.add(interactionListener);

		rect01 = new RectShape01(space);
		rect02 = new RectShape02(space);
		collidingSetup();
	}

	public function update():Void {
		space.step(1 / 60);
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		rect01.render(graphics);
		rect02.render(graphics);
		graphics.end();
	}

	public function collidingSetup(){
		rect01.body.cbTypes.add(rectCollisionType);
		rect02.body.cbTypes.add(rectCollisionType);
	}

	public function colliding(colliding:InteractionCallback){
		trace('BOOM!!! WE COLLIDED');
	}
}
