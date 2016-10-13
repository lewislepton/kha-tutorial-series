package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.math.FastMatrix3;

class Camera {
	public var x:Float;
	public var y:Float;
	public var trans:FastMatrix3;

	public function new(){
		trans = FastMatrix3.identity();
	}

	public function set(graphics:Graphics){
		graphics.transformation = trans;
		graphics.translate(-this.x, -this.y);
	}

	public function unset(graphics:Graphics){
		graphics.popTransformation();
	}
}