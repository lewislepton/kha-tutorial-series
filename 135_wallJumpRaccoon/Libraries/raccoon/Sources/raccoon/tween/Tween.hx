package raccoon.tween;

class Tween {
  private var _from:Float;
  private var _to:Float;
  private var _time:Float;
  private var _duration:Float;
  private var _set:Float->Float->Void;
  private var _ease:Float->Float;
  private var _finished:Bool;
  private var _onCompleteFunc:Null<Void->Void>;

  public function new(from:Float, to:Float, duration:Float, ease:Float->Float, set:Float->Float->Void){
    this._from = from;
    this._to = to - from;
    this._duration = duration;
    this._set = set;
    this._ease = ease;
    _time = 0;
    _finished = false;
  }

  public function update(){
    if (_finished) return;

    _time += 1 / 60;
    if (_time >= _duration){
      _set(1, _from + _to);
      _finished = true;
      finish();
    } else {
      var t = _time / _duration;
      _set(t, _from + _ease(t) * _to);
    }
  }

  function finish(){
    if (_onCompleteFunc!= null) _onCompleteFunc();
  }

  public function onComplete(func:Void->Void){
    _onCompleteFunc = func;
    return this;
  }
}