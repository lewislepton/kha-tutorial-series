package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;

class Player {
  public var x:Int;
  public var y:Int;
  
  public var speed = 6.0;
  
  public var left:Bool;
  public var right:Bool;
  public var up:Bool;
  public var down:Bool;
  
  public function new(){
    this.x = 0;
    this.y = 0;
  }

  public function update(){
    
  }

  public function render(graphics:Graphics){
    graphics.fillRect(x, y, 32, 32);
  }
}
