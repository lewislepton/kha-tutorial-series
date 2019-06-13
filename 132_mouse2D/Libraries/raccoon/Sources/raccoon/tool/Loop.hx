package raccoon.tool;

class Loop {
	private var _start:Int;
	private var _end:Int;
	private var _step:Int;

	public function new(start:Int, end:Int, step:Int){
		this._start = start;
		this._end = end;
		this._step = step;
	}

	public inline function hasNext() return _start < _end;
	public inline function next() return (_start += _step) - _step;
}