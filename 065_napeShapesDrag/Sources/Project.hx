package;

import kha.Framebuffer;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.input.Mouse;

import nape.space.Space;
import nape.geom.Vec2;
import nape.constraint.PivotJoint;

import RectShape02;

class Project {
	public var space:Space;
	public var rect02:RectShape02;

	public var pivotJoint:PivotJoint;
	public var mouseX:Int;
	public var mouseY:Int;

	public function new() {
		space = new Space(new Vec2(0, 0));
		space.worldLinearDrag = 0.6;
		space.worldAngularDrag = 0.6;

		rect02 = new RectShape02(space);

		pivotJoint = new PivotJoint(space.world, null, Vec2.weak(), Vec2.weak());
		pivotJoint.space = space;
		pivotJoint.active = false;
		rect02.body.isStatic();
		pivotJoint.stiff = false;

		Mouse.get().notify(onMouseDown, onMouseUp, onMouseMove, null);
	}

	public function update():Void {
		space.step(1 / 60);
		rect02.update();

		if (pivotJoint != null && pivotJoint.active){
			pivotJoint.anchor1.setxy(mouseX, mouseY);
		}
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		rect02.render(graphics);
		graphics.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int){
		var mousePosition = Vec2.get(x, y);
		for (rect in space.bodiesUnderPoint(mousePosition)){
			if (!rect.isDynamic()){
				continue;
			}
			pivotJoint.body2 = rect;
			pivotJoint.anchor2.set(rect.worldPointToLocal(mousePosition, true));
			pivotJoint.active = true;
			break;
		}
		mousePosition.dispose();
	}

	public function onMouseUp(button:Int, x:Int, y:Int){
		if (pivotJoint != null) pivotJoint.active = false;
	}

	public function onMouseMove(x:Int, y:Int, cx:Int, cy:Int){
		mouseX = x;
		mouseY = y;
	}
}
