package;

import kha.Framebuffer;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.Key;
import kha.input.Keyboard;

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
	public var rect02:RectShape02;

	public function new() {
		space = new Space(new Vec2(0, 0));
		space.worldLinearDrag = 0.6;
		space.worldAngularDrag = 0.6;

		rect02 = new RectShape02(space);
		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update():Void {
		space.step(1 / 60);
		rect02.update();
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		rect02.render(graphics);
		graphics.end();
	}

	public function onKeyDown(key:Key, char:String){
		rect02.onKeyDown(key, char);
	}

	public function onKeyUp(key:Key, char:String){
		rect02.onKeyUp(key, char);
	}
}
