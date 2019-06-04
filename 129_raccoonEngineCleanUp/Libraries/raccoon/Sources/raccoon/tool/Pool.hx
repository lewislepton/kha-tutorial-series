package raccoon.tool;

import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import raccoon.Object;

class Pool<O:Object> extends Object {
	public var entity:Array<O>;
	public var max:Int;

	private var _count:Int = 0;

	public function new(max:Int = 100){
		super();
		this.max = max;
		entity = [];
	}

	override public function update(){
		var i:Int = 0;
		while (i < entity.length){
			var member = entity[i];
			if (member != null){
				if (member.active){
					member.update();
					if (!member.active){
						if (i < _count){
							_count = i;
						}
					}
				}
			}
			i++;
		}
		super.update();
	}

	override public function render(canvas:Canvas){
		for (member in entity){
			if (member != null && member.active){
				member.render(canvas);
			}
		}
	}

	private function first():Int {
		var i = _count;
		while (i < entity.length + _count){
			var h = i % entity.length;
			if (entity[h] == null || !entity[h].active){
				if (i < entity.length){
					_count++;
				}
			}
			i++;
		}
		return -1;
	}

	public function add(object:O):O {
		var full:Bool = entity.length >= max;
		if (!full){
			entity.push(object);
			return object;
		} else {
			var index = first();
			entity[index] = object;
			return object;
		}
	}
}