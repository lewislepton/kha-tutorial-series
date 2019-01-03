package lkl.tool;

class Loop {
	var start:Int;
	var end:Int;
	var step:Int;

	public function new(start:Int, end:Int, step:Int){
		this.start = start;
		this.end = end;
		this.step = step;
	}

	public inline function hasNext() return start < end;
	public inline function next() return (start += step) - step;
}