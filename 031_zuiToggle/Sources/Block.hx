package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;

class Block {
  public var width:Float;
  public var height:Float;
  
  public function new(){
    
  }

  public function update(){
    
  }

  public function render(graphics:Graphics){
    graphics.fillRect(400, 400, width, height);
  }
}