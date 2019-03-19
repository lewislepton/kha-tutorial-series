import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

class Brick {
  public var x:Float;
  public var y:Float;
  public var width:Float;
  public var height:Float;

  public function new(x:Float, y:Float, width:Float = 32, height:Float = 32){
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  public function update(){
    
  }

  public function render(graphics:Graphics){
    graphics.fillRect(x, y, width, height);
  }
}