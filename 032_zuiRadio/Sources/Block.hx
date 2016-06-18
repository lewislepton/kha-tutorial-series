package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;

class Block {
  public var width:Float;
  public var height:Float;
  public var color:Color;
  
  public function new(){
    
  }

  public function update(){
    
  }

  public function render(graphics:Graphics){
    graphics.color = color;
    graphics.fillRect(400, 400, width, height);
  }
}