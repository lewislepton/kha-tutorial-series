package raccoon;

import kha.Canvas;
import raccoon.Object;

class Scene {
  public var countEntities(get, null):Int;
  private var _entities:Array<Object>;

  public function new(){
    _entities = new Array<Object>();
  }

  public function update(){
    for (entity in _entities) entity.update();
  }

  public function render(canvas:Canvas){
    for (entity in _entities) entity.render(canvas);
  }

  public function get_countEntities():Int {
    return _entities.length;
  }

  public function clear(){
    _entities = new Array<Object>();
  }

  public function add(entity:Object){
    entity.active = true;
    _entities.push(entity);
  }

  public function remove(entity:Object){
    entity.active = false;
    _entities.remove(entity);
    entity = null;
  }
}