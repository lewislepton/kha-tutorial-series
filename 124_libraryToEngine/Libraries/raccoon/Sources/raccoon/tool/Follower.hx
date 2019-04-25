package raccoon.tool;

import raccoon.Entity;

class Follower {
	public var speed = 0.6;
	public var range = 200.00;
	var rate = 1.0;
	var x:Float = 0;
	var y:Float = 0;

	public function new(){}

	public function update(entity01:Entity, entity02:Entity){
		var distanceX:Float = entity01.position.x - entity02.position.x;
		var distanceY:Float = entity01.position.y - entity02.position.y;

		var total = Math.sqrt(distanceX * distanceX + distanceY * distanceY);

		if (total <= range){
			distanceX = rate * distanceX / total;
			distanceY = rate * distanceY / total;

			x += distanceX;
			y += distanceY;

			var totalDistance = Math.sqrt(x * x + y * y);

			x = speed * x / totalDistance;
			y = speed * y / totalDistance;

			entity02.position.x += x;
			entity02.position.y += y;
		}
	}
}