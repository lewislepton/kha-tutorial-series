package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;

class Block {
  public var x:Int;
  public var y:Int;
  public var isActive:Bool;
  
  public function new(x:Int, y:Int){
    this.x = x;
    this.y = y;
    activate(x, y);
  }

  public function update(){
    
  }
  
  public function activate(x:Int, y:Int):Void {
    isActive = true;
  }

  public function render(graphics:Graphics){
    if (!isActive) return;
    graphics.fillRect(x, y, 64, 64);
  }
}