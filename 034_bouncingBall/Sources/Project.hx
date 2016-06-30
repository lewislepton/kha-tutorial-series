package;

import kha.Framebuffer;

import Ball;

class Project {
	public var ball:Ball;
	
	public function new() {
		ball = new Ball(400, 300);
	}

	public function update():Void {
		ball.update();
		bounce();
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		ball.render(graphics);
		graphics.end();
	}
	
	public function bounce(){
		if (ball.x < ball.size){
			ball.dirX = -ball.dirX;
		}
		if (ball.x > 800 - ball.size){
			ball.dirX = -ball.dirX;
		}
		
		if (ball.y < ball.size){
			ball.dirY = -ball.dirY;
		}
		if (ball.y > 600 -ball.size){
			ball.dirY = -ball.dirY;
		}
	}
}
