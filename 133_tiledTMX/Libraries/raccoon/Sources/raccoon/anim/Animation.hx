package raccoon.anim;

/*
Originally coded & created by Robert Konrad
http://robdangero.us
https://github.com/Kha-Samples/Kha2D

Edited for the Kha Tutorial Series by Lewis Lepton
https://lewislepton.com
https://github.com/lewislepton/kha-tutorial-series
*/

class Animation {
	private var _indices: Array<Int>;
	private var _speeddiv: Int;
	private var _count: Int;
	private var _index: Int;
	
	public static function create(index: Int) {
		var indices = [index];
		return new Animation(indices, 1);
	}
	
	public static function createRange(minindex: Int, maxindex: Int, speeddiv: Int): Animation {
		var indices = new Array<Int>();
		for (i in 0...maxindex - minindex + 1) indices.push(minindex + i);
		return new Animation(indices, speeddiv);
	}
	
	public function new(indices: Array<Int>, speeddiv: Int) {
		this._indices = indices;
		_index = 0;
		this._speeddiv = speeddiv;
	}
	
	public function take(animation: Animation) {
		if (_indices == animation._indices) return;
		_indices = animation._indices;
		_speeddiv = animation._speeddiv;
		reset();
	}
	
	public function get(): Int {
		return _indices[_index];
	}
	
	public function getIndex(): Int {
		return _index;
	}
	
	public function setIndex(index: Int): Void {
		if (index < _indices.length) this._index = index;
	}
	
	public function next(): Bool {
		++_count;
		if (_count % _speeddiv == 0) {
			++_index;
			if (_index >= _indices.length) {
				_index = 0;
				return false;
			}
		}
		return true;
	}
	
	public function reset(): Void {
		_count = 0;
		_index = 0;
	}
}