package lkl.collide;

import kha.math.Vector2;
import lkl.Object;
import lkl.tool.Direction;

class Rectangle extends Object {
	public var onGround = false;
	var collision:Int;
	
	public function new(x:Float, y:Float, width:Float, height:Float){
		super(x, y, width, height);
	}

	public function overlap(other:Rectangle){
		return position.x <= other.position.x + other.width && position.x + width >= other.position.x && position.y <= other.position.y + other.height && position.y + height >= other.position.y;
	}

	public function collideRect(entity:Entity):Bool {
		checkRectCollision();
		var dx = (this.position.x + this.width / 2) - (entity.position.x + entity.width / 2);
		var dy = (this.position.y + this.height / 2) - (entity.position.y + entity.height / 2);

		var combined:Vector2 = new Vector2();
		combined.x = this.center.x + entity.center.x;
		combined.y = this.center.y + entity.center.y;

		if (Math.abs(dx) < combined.x){
			if (Math.abs(dy) < combined.y){
				var overlap:Vector2 = new Vector2();
				overlap.x = combined.x - Math.abs(dx);
				overlap.y = combined.y - Math.abs(dy);
				if (overlap.x >= overlap.y){
					if (dy > 0){
						this.collision = Direction.UP;
						this.position.y += overlap.y;
					} else {
						this.collision = Direction.DOWN;
						this.position.y -= overlap.y;
					}
				} else {
					if (dx > 0){
						this.collision = Direction.LEFT;
						this.position.x += overlap.x;
					} else {
						this.collision = Direction.RIGHT;
						this.position.x -= overlap.x;
					}
				}
			} else {
				this.collision = Direction.NONE;
			}
		} else {
			this.collision = Direction.NONE;
		}
		return false;
	}

	function checkRectCollision(){
		if (collision == Direction.DOWN && velocity.y >= 0){
			onGround = true;
			velocity.y = 0;
		} else if (collision == Direction.UP && velocity.y <= 0){
			onGround = false;
			velocity.y = 0;
		} else if (collision == Direction.RIGHT && velocity.x >= 0){
			onGround = false;
			velocity.x = 0;
		} else if (collision == Direction.LEFT && velocity.x <= 0){
			onGround = false;
			velocity.x = 0;
		}
		if (collision != Direction.DOWN && velocity.y > 0){
			onGround = false;
		}
	}
}