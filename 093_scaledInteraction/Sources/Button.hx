package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;

class Button {
  public var x:Int;
  public var y:Int;
  public var width:Int;
  public var height:Int;
  public var color:Color;
  public var onClick:Void->Void;
  
  public function new(x:Int, y:Int, width:Int, height:Int, color:Color){
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.color = color;
  }

  public function update(){
    
  }

  public function render(graphics:Graphics){
    graphics.color = color;
    graphics.fillRect(x, y, width, height);
  }
  
  public function onMouseDown(xPos:Int, yPos:Int){
    if (xPos >= this.x && xPos <= this.x + this.width && yPos >= this.y && yPos <= this.y + this.height){
      if (this.onClick != null) onClick();
      return true;
    }
    return false;
  }
}