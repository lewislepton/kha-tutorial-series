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
  
  public function onMouseDown(button:Int, xPos:Int, yPos:Int){
    if (button == 0){
      if (xPos >= this.x && xPos <= this.x + this.width && yPos >= this.y && yPos <= this.y + this.height){
        trace('THIS HAS BEEN PRESSED');
      }
    }
  }
}