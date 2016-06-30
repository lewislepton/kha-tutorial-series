package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;

class Ball {
  public var x:Int;
  public var y:Int;
  public var dirX = 6;
  public var dirY = 6;
  public var size = 16;
  
  public function new(x:Int, y:Int){
    this.x = x;
    this.y = y;
  }

  public function update(){
    x += dirX;
    y += dirY;
  }

  public function render(graphics:Graphics){
    graphics.fillCircle(x, y, size);
  }
}