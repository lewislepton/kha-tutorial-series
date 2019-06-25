package raccoon.tmx;

import haxe.xml.Access;
import kha.Canvas;
import kha.graphics2.Graphics;
import raccoon.tmx.display.KhaRenderer;
import raccoon.tmx.display.Renderer;
import kha.Color;

/**
 * This class represents a TILED map
 * @author Christopher Kaster
 */
class TiledMap {
	public var camx(default, set):Int;
	public var camy(default, set):Int;
	public var screenOffsetX:Int;
	public var screenOffsetY:Int;
	public var version:String;
	public var bgColor:Color;
	public var fullWidth:Int;
	public var fullHeight:Int;

	/** The path of the map file */
	public var path(default, null):String;

	/** The map width in tiles */
	public var widthInTiles(default, null):Int;

	/** The map height in tiles */
	public var heightInTiles(default, null):Int;

	/** The map width in pixels */
	public var totalWidth(get, null):Int;

	/** The map height in pixels */
	public var totalHeight(get, null):Int;

	/** TILED orientation: Orthogonal or Isometric */
	public var orientation(default, null):TiledMapOrientation;

	/** The tile width */
	public var tileWidth(default, null):Int;

	/** The tile height */
	public var tileHeight(default, null):Int;

	/** The background color of the map */
	public var backgroundColor(default, null):UInt;

	/** All tilesets the map is using */
	public var tilesets(default, null):Array<Tileset>;

	/** Contains all layers from this map */
	public var layers(default, null):Array<Layer>;

	/** All objectgroups */
	public var objectGroups(default, null):Array<TiledObjectGroup>;

	/** All image layers **/
	public var imageLayers(default, null):Array<ImageLayer>;

	/** All map properties */
	public var properties(default, null):Map<String, String>;

	public var backgroundColorSet(default, null):Bool = false;
	public var renderer(default, null):Renderer;

	public function new(path:String, renderer:Renderer) {
		this.path = path;

		var xml = Helper.getText(path);

		// parseXML(xml);

		var source:Access = null;
		var node:Access = null;

		// string data
		source = new Access(Xml.parse(xml));
		source = source.node.map;

		// init arrays
		this.properties = new Map<String, String>();
		this.imageLayers = new Array<ImageLayer>();
		this.tilesets = new Array<Tileset>();
		this.objectGroups = new Array<TiledObjectGroup>();
		this.layers = new Array<Layer>();

		// load tmx stuff in chunks
		loadAttributes(source);
		loadProperties(source);
		loadTilesets(source);
		loadLayers(source);

		// TODO : // use this to export to kha2D tilemap
		// trace(this.layers[1].tiles[1].gid);

		// set camera to 0
		camx = 0;
		camy = 0;

		this.renderer = renderer;

		renderer.setTiledMap(this);
	}

	public function loadAttributes(source:Access):Void {
		widthInTiles = Std.parseInt(source.att.width);
		heightInTiles = Std.parseInt(source.att.height);

		version = (source.att.version != null) ? source.att.version : "unknown";
		orientation = (source.att.orientation != null) ? TiledMapOrientation.Orthogonal : TiledMapOrientation.Isometric;
		bgColor = (source.has.backgroundcolor && source.att.backgroundcolor != null) ? Color.fromString(source.att.backgroundcolor) : Color.fromValue(0x000000);
		tileWidth = Std.parseInt(source.att.tilewidth);
		tileHeight = Std.parseInt(source.att.tileheight);

		totalWidth = Std.parseInt(source.att.width);
		totalHeight = Std.parseInt(source.att.height);
		// // Calculate the entire size
		fullWidth = widthInTiles * tileWidth;
		fullHeight = heightInTiles * tileHeight;
	}

	private function loadProperties(source:Access):Void {
		for (child in source.elements) {
			if (child.name == "layer") {
				if (child.hasNode.properties)
					properties.set(child.node.properties.node.property.att.name, child.node.properties.node.property.att.value);
			}
		}
	}

	private function loadTilesets(source:Access):Void {
		for (child in source.elements) {
			var tileset:Tileset = null;
			if (child.name == "tileset") {
				// trace(child.x.toString()); // get XML from FAST
				tileset = Tileset.fromGenericXml(this, child.x.toString());
				tileset.setFirstGID(Std.parseInt(child.att.firstgid));

				this.tilesets.push(tileset);
			}
		}
	}

	public function loadLayers(source:Access):Void {
		// LAYERS
		for (child in source.elements) {
			if (child.name == "layer") {
				var layer:Layer = Layer.fromGenericXml(child.x, this);
				this.layers.push(layer);
			}

			// OBJECT GROUPS
			if (child.name == "objectgroup") {
				var objectGroup = TiledObjectGroup.fromGenericXml(child.x);

				this.objectGroups.push(objectGroup);
			}

			// IMAGE LAYERS
			if (child.name == "imagelayer") {
				var imageLayer = ImageLayer.fromGenericXml(this, child.x);

				this.imageLayers.push(imageLayer);
			}
		}
	}

	public function render(canvas:Canvas) {
		// renderer.clear(canvas);

		for (imageLayer in this.imageLayers) {
			renderer.drawImageLayer(canvas, imageLayer);
		}

		for (layer in this.layers) {
			renderer.drawLayer(canvas, layer);
		}
	}

	/**
	 * Creates a new TiledMap from Assets
	 * @param path The path to your asset
	 * @param render Should openfl-tiled render the map?
	 * @return A TiledMap object
	 */
	public static function fromAssets(path:String):TiledMap {
		var renderer = new KhaRenderer();

		return new TiledMap(path, renderer);
	}

	/**
	 * Creates a new TiledMap from Assets with an alternative Renderer
	 * @param path The path to your asset
	 * @param renderer Add your own renderer implementation here
	 * @return A TiledMap object
	 */
	public static function fromAssetsWithAlternativeRenderer(path:String, renderer:Renderer):TiledMap {
		return new TiledMap(path, renderer);
	}

	private function parseXML(xml:String) {
		var xml = Xml.parse(xml).firstElement();

		this.widthInTiles = Std.parseInt(xml.get("width"));
		this.heightInTiles = Std.parseInt(xml.get("height"));
		this.orientation = xml.get("orientation") == "orthogonal" ? TiledMapOrientation.Orthogonal : TiledMapOrientation.Isometric;
		this.tileWidth = Std.parseInt(xml.get("tilewidth"));
		this.tileHeight = Std.parseInt(xml.get("tileheight"));
		this.tilesets = new Array<Tileset>();
		this.layers = new Array<Layer>();
		this.objectGroups = new Array<TiledObjectGroup>();
		this.imageLayers = new Array<ImageLayer>();
		this.properties = new Map<String, String>();

		// get background color
		var backgroundColor:String = xml.get("backgroundcolor");

		// if the element isn't set choose white
		if (backgroundColor != null) {
			this.backgroundColorSet = true;

			// replace # with 0xff to match ARGB
			backgroundColor = StringTools.replace(backgroundColor, "#", "0xff");

			this.backgroundColor = Std.parseInt(backgroundColor);
		} else {
			this.backgroundColor = 0x00000000;
		}

		for (child in xml.elements()) {
			// if(Helper.isValidElement(child)) {
			if (child.nodeName == "tileset") {
				var tileset:Tileset = null;
				if (child.get("source") != null) {
					tileset = Tileset.fromGenericXml(this, Helper.getText(child.get("source")));
				} else {
					tileset = Tileset.fromGenericXml(this, child.toString());
				}

				tileset.setFirstGID(Std.parseInt(child.get("firstgid")));

				this.tilesets.push(tileset);
			} else if (child.nodeName == "properties") {
				for (property in child) {
					if (!Helper.isValidElement(property))
						continue;
					properties.set(property.get("name"), property.get("value"));
				}
			} else if (child.nodeName == "layer") {
				var layer:Layer = Layer.fromGenericXml(child, this);

				this.layers.push(layer);
			} else if (child.nodeName == "objectgroup") {
				var objectGroup = TiledObjectGroup.fromGenericXml(child);

				this.objectGroups.push(objectGroup);
			} else if (child.nodeName == "imagelayer") {
				var imageLayer = ImageLayer.fromGenericXml(this, child);

				this.imageLayers.push(imageLayer);
			}
			// }
		}
	}

	/**
	 * Returns the Tileset which contains the given GID.
	 * @return The tileset which contains the given GID, or if it doesn't exist "null"
	 */
	public function getTilesetByGID(gid:Int):Tileset {
		var tileset:Tileset = null;

		for (t in this.tilesets) {
			if (gid >= t.firstGID) {
				tileset = t;
			}
		}

		return tileset;
	}

	/**
	 * Set the camera X position
	 * @return camerax position
	 */
	function set_camx(newcamx:Int):Int {
		camx = newcamx;
		// trace("collisionLayer", collisionLayer);
		// if (collisionLayer != null) {
		// 	screenOffsetX = Std.int(Math.min(Math.max(0, camx - width / 2), collisionLayer.getMap().getWidth() * collisionLayer.getMap().getTileset().TILE_WIDTH - width));
		// 	if (getWidth() < width) screenOffsetX = 0;
		// }
		screenOffsetX = camx;
		return camx;
	}

	/**
	 * Set the camera Y position
	 * @return cameray position
	 */
	function set_camy(newcamy:Int):Int {
		camy = newcamy;
		// trace("collisionLayer", collisionLayer);
		// if (collisionLayer != null) {
		// 	screenOffsetX = Std.int(Math.min(Math.max(0, camx - width / 2), collisionLayer.getMap().getWidth() * collisionLayer.getMap().getTileset().TILE_WIDTH - width));
		// 	if (getWidth() < width) screenOffsetX = 0;
		// }
		screenOffsetY = camy;
		return camy;
	}

	/**
	 * Returns the total Width of the map
	 * @return Map width in pixels
	 */
	private function get_totalWidth():Int {
		trace("doing calculations");
		trace(this.widthInTiles);
		return this.widthInTiles * this.tileWidth;
	}

	/**
	 * Returns the total Height of the map
	 * @return Map height in pixels
	 */
	private function get_totalHeight():Int {
		return this.heightInTiles * this.tileHeight;
	}

	/**
	 * Returns the layer with the given name.
	 * @param name The name of the layer
	 * @return The searched layer, null if there is no such layer.
	 */
	public function getLayerByName(name:String):Layer {
		for (layer in this.layers) {
			if (layer.name == name) {
				return layer;
			}
		}

		return null;
	}

	/**
	 * Returns the object group with the given name.
	 * @param name The name of the object group
	 * @return The searched object group, null if there is no such object group.
	 */
	public function getObjectGroupByName(name:String):TiledObjectGroup {
		for (objectGroup in this.objectGroups) {
			if (objectGroup.name == name) {
				return objectGroup;
			}
		}

		return null;
	}

	/**
	 * Returns an object in a given object group
	 * @param name The name of the object
	 * @param inObjectGroup The object group which contains this object.
	 * @return An TiledObject, null if there is no such object.
	 */
	public function getObjectByName(name:String, inObjectGroup:TiledObjectGroup):TiledObject {
		for (object in inObjectGroup) {
			if (object.name == name) {
				return object;
			}
		}

		return null;
	}
}