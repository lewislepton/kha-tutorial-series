import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import raccoon.Entity;

class Block extends Entity {
  public function new(){
    super(0, 0);
  }

  override public function update(){
    super.update();
  }

  override public function render(canvas:Canvas){
    super.render(canvas);
    canvas.g2.color = Color.Pink;
    canvas.g2.fillRect(position.x, position.y, width, height);
  }
}