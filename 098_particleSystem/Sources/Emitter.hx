import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import Particle;

class Emitter {
	public var arParticle:Array<Particle>;
	public var amount:Int;
	public var power = 3.0;
	
	public function new(amount:Int){
		this.amount = amount;

		arParticle = [];
	}

	public function update(){
		var p = arParticle.length;
		while (p --> 0){
			arParticle[p].update();
			if (arParticle[p].position.x <= 0 || arParticle[p].position.x >= Main.WIDTH || arParticle[p].position.y <= 0 || arParticle[p].position.y >= Main.HEIGHT){
				arParticle.splice(p, 1);
			}
		}
	}

	public function render(graphics:Graphics){
		for (particle in arParticle){
			particle.render(graphics);
		}
	}

	public function spawn(?x:Float, ?y:Float){
		for (i in 0 ... amount){
			var particle = new Particle(x, y);
			particle.acceleration = -0.5;
			particle.velocity.x = randomRangeFloat(-power, power);
			particle.velocity.y = randomRangeFloat(-power, power);
			arParticle.push(particle);
		}
	}

	public function randomRangeFloat(min:Float, max:Float):Float {
		return Math.floor(Math.random() * (1 + max - min)) + min;
	}
}