package char;

import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import raccoon.Texture;

class Crate extends Texture {
  public function new(x:Float, y:Float){
    super(Assets.images.crate, x, y);
  }

  override public function update(){
    super.update();
  }

  override public function render(canvas:Canvas){
    super.render(canvas);
  }
}