package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;

class Block {
  public var x:Float;
  public var y:Float;
  public var width:Float;
  public var height:Float;
  
  public function new(){
    
  }

  public function update(){
    
  }

  public function render(graphics:Graphics){
    graphics.fillRect(x, y, width, height);
  }
}