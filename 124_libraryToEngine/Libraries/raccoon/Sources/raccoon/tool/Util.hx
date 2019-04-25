package raccoon.tool;

class Util {
	public static function randomRangeFloat(min:Float, max:Float):Float {
		return Math.floor(Math.random() * (1 + max - min)) + min;
	}

	public static function lerp(min:Float, max:Float, value:Float):Float {
		return min + (max - min) * value;
	}

	public static function degToRad(degrees:Float):Float {
		return degrees * Math.PI / 180;
	}

	public static function radToDeg(radians:Float):Float {
		return radians * 180 / Math.PI;
	}
}