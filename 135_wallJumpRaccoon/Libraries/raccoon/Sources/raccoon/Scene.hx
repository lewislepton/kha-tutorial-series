package raccoon;

import haxe.ds.ArraySort;
import kha.Canvas;
import raccoon.Object;

class Scene {
  public var countEntities(get, null):Int;
  private var _entities:Array<Object>;

  private var _depth:Bool;

  public function new(){
    _entities = new Array<Object>();
  }

  public function update(){
    for (entity in _entities) entity.update();
  }

  public function render(canvas:Canvas){
    if (_depth) depth(_entities);

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

  function depth(entities:Array<Object>){
    if (entities.length == 0) return;
    ArraySort.sort(entities, function(ent1:Object, ent2:Object){
      if (ent1.position.y + ent1.height < ent2.position.y + ent2.height){
        return -1;
      } else if (ent1.position.y == ent2.position.y){
        return 0;
      } else {
        return 1;
      }
    });
  }

  public function sort(?value:Bool = false):Bool {
    return _depth = value;
  }
}