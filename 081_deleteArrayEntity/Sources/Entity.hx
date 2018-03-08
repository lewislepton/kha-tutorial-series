class Entity {
	public var x:Float;
	public var y:Float;
	public var width:Float;
	public var height:Float;
	public var active:Bool;

	public function new(x:Float, y:Float, ?width:Float, ?height:Float){
		this.x = x - width / 2;
		this.y = y - height / 2;
		this.width = width;
		this.height = height;
		activate(x, y);
	}

	public function activate(x:Float, y:Float){
		active = true;
	}
}