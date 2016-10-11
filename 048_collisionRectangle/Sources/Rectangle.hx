package;

class Rectangle {
	public var x:Float;
	public var y:Float;
	public var width:Float;
	public var height:Float;

	public function new(x:Float, y:Float, width:Float, height:Float){
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}

	public function overlap(other:Rectangle):Bool {
		return x <= other.x + other.width && x + width >= other.x && y <= other.y + other.height && y + height >= other.y;
	}
}