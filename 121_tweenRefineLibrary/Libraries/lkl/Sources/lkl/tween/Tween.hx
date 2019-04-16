package lkl.tween;

class Tween {
  var from:Float;
  var to:Float;
  var time:Float;
  var duration:Float;
  var set:Float->Float->Void;
  var ease:Float->Float;
  var finished:Bool;
  var onCompleteFunc:Null<Void->Void>;

  public function new(from:Float, to:Float, duration:Float, ease:Float->Float, set:Float->Float->Void){
    this.from = from;
    this.to = to - from;
    this.duration = duration;
    this.set = set;
    this.ease = ease;
    time = 0;
    finished = false;
  }

  public function update(){
    if (finished) return;

    time += 1 / 60;
    if (time >= duration){
      set(1, from + to);
      finished = true;
      finish();
    } else {
      var t = time / duration;
      set(t, from + ease(t) * to);
    }
  }

  function finish(){
    if (onCompleteFunc!= null) onCompleteFunc();
  }

  public function onComplete(func:Void->Void){
    onCompleteFunc = func;
    return this;
  }
}