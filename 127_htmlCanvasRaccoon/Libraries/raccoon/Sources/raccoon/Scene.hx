package raccoon;

import kha.Canvas;
import raccoon.Object;

class Scene {
  public var countEntities(get, null):Int;
  var entities:Array<Object>;

  public function new(){
    entities = new Array<Object>();
  }

  public function update(){
    for (entity in entities) entity.update();
  }

  public function render(canvas:Canvas){
    for (entity in entities) entity.render(canvas);
  }

  public function get_countEntities():Int {
    return entities.length;
  }

  public function clear(){
    entities = new Array<Object>();
  }

  public function add(entity:Object){
    entity.active = true;
    entities.push(entity);
  }

  public function remove(entity:Object){
    entity.active = false;
    entities.remove(entity);
    entity = null;
  }
}