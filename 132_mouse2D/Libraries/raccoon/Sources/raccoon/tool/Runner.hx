package raccoon.tool;

import raccoon.Entity;

class Runner {
	public var speed = 0.6;
	public var range = 200.00;
	private var _rate = 1.0;
	private var _x:Float = 0;
	private var _y:Float = 0;

	public function new(){}

	public function update(entity01:Entity, entity02:Entity){
		var distanceX:Float = entity01.position.x - entity02.position.x;
		var distanceY:Float = entity01.position.y - entity02.position.y;

		var total = Math.sqrt(distanceX * distanceX + distanceY * distanceY);

		if (total <= range){
			distanceX = _rate * distanceX / total;
			distanceY = _rate * distanceY / total;

			_x -= distanceX;
			_y -= distanceY;

			var totalDistance = Math.sqrt(_x * _x + _y * _y);

			_x = speed * _x / totalDistance;
			_y = speed * _y / totalDistance;

			entity02.position.x += _x;
			entity02.position.y += _y;
		}
	}
}