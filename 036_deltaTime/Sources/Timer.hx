package;

import kha.Scheduler;

class Timer {
  public var delta:Float;
  public var current:Float;
  
  public function new(){
    
  }
  
  public function update(){
    delta = Scheduler.time() - current;
    current = Scheduler.time();
  }
}