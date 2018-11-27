package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Mouse;

import Ball;

class Project {
	var arBall:Array<Ball>;

	public function new(){
		arBall = [];

		Mouse.get().notify(onMouseDown, null, null, null);
	}

	public function update():Void {
		for (ball in arBall){
			ball.update();
		}
		trace(arBall.length);
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		for (ball in arBall){
			ball.render(graphics);
		}
		graphics.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		if (button == 0){
			create(x, y);
		} else if (button == 1){
			delete();
		}
	}

	public function create(?x:Float = 0, ?y:Float = 0){
		for (ball in arBall){
			if (!ball.active){
				ball.activate(x, y);
				return;
			}
		}
		arBall.push(new Ball(x, y));
	}

	public function delete(){
		arBall = [];
	}
}