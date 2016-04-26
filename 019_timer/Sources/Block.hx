package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;

class Block {
  public var x:Float;
  public var y:Float;
  
  public function new(x:Float, y:Float){
    this.x = x;
    this.y = y;
  }

  public function update(){
    
  }

  public function render(graphics:Graphics){
    graphics.fillRect(x, y, 64, 64);
  }
}