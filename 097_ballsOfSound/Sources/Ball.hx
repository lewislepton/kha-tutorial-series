import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.audio1.Audio;
import kha.audio1.AudioChannel;

class Ball {
	public var x:Float;
	public var y:Float;

	var radius = 64;
	var velocityX:Float;
	var velocityY:Float;
	var sndBall:AudioChannel;

	public var active:Bool;

	public function new(x:Float, y:Float){
		this.x = x;
		this.y = y;

		velocityX = randomRangeFloat(-6, 6);
		velocityY = randomRangeFloat(-6, 6);

		var choiceSnd = Math.floor(Math.random() * 10);
		sndBall = Audio.play(Assets.sounds.get('_' + choiceSnd), false);
		sndBall.pause();
		sndBall.volume = 0.3;

		activate(x, y);
	}

	public function update(){
		if (!active) return;
		x += velocityX;
		y += velocityY;

		if (x < 0 + radius || x > Main.WIDTH -radius){
			velocityX = - velocityX;
			sndBall.play();
		}

		if (y < 0 + radius || y > Main.HEIGHT -radius){
			velocityY = - velocityY;
			sndBall.play();
		}
	}

	public function render(graphics:Graphics){
		if (!active) return;
		graphics.color = Color.Pink;
		graphics.fillCircle(x, y, radius);
		graphics.color = Color.Cyan;
		graphics.fillCircle(x, y, radius - 8);
	}

	public function activate(?x:Float, ?y:Float){
		active = true;
	}

	public function randomRangeFloat(low:Float, high:Float):Float {
		return Math.floor(Math.random() * (1 + high - low)) + low;
	}
}