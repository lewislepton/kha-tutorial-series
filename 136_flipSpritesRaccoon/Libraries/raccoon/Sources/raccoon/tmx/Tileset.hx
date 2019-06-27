package raccoon.tmx;

import haxe.xml.Fast;
import kha.math.Vector2;
import raccoon.tmx.Rectangle;
import haxe.io.Path;

class Tileset {
	/** The TiledMap object this tileset belongs to */
	public var tiledMap(default, null):TiledMap;

	/** The first GID this tileset has */
	public var firstGID(default, null):Int;

	/** The name of this tileset */
	public var name(default, null):String;

	/** The width of the tileset image */
	public var width(get, null):Int;

	/** The height of the tileset image */
	public var height(get, null):Int;

	/** The width of one tile */
	public var tileWidth(default, null):Int;

	/** The height of one tile */
	public var tileHeight(default, null):Int;

	/** The spacing between the tiles */
	public var spacing(default, null):Int;

	/** All properties this Tileset contains */
	public var properties(default, null):Map<String, String>;

	/** All tiles with special properties */
	public var propertyTiles(default, null):Map<Int, PropertyTile>;

	/** All terrain types */
	public var terrainTypes(default, null):Array<TerrainType>;

	/** The image of this tileset */
	public var image(default, null):TilesetImage;

	/** The tile offset */
	public var offset(default, null):Vector2;

	private function new(tiledMap:TiledMap, name:String, tileWidth:Int, tileHeight:Int, spacing:Int, properties:Map<String, String>,
			terrainTypes:Array<TerrainType>, image:TilesetImage, offset:Vector2) {
		this.tiledMap = tiledMap;
		this.name = name;
		this.tileWidth = tileWidth;
		this.tileHeight = tileHeight;
		this.spacing = spacing;
		this.properties = properties;
		this.terrainTypes = terrainTypes;
		this.image = image;
		this.offset = offset;
	}

	/** Sets the first GID. */
	public function setFirstGID(gid:Int) {
		this.firstGID = gid;
	}

	/** Generates a new Tileset from the given Xml code */
	public static function fromGenericXml(tiledMap:TiledMap, content:String):Tileset {
		var xml = Xml.parse(content).firstElement();

		var name:String = xml.get("name");
		var tileWidth:Int = Std.parseInt(xml.get("tilewidth"));
		var tileHeight:Int = Std.parseInt(xml.get("tileheight"));
		var spacing:Int = xml.exists("spacing") ? Std.parseInt(xml.get("spacing")) : 0;
		var properties:Map<String, String> = new Map<String, String>();
		var propertyTiles:Map<Int, PropertyTile> = new Map<Int, PropertyTile>();
		var terrainTypes:Array<TerrainType> = new Array<TerrainType>();
		var image:TilesetImage = null;

		var tileOffsetX:Int = 0;
		var tileOffsetY:Int = 0;

		for (child in xml.elements()) {
			if (child.nodeName == "properties") {
				for (property in child) {
					properties.set(property.get("name"), property.get("value"));
				}
			}

			if (child.nodeName == "tileoffset") {
				tileOffsetX = Std.parseInt(child.get("x"));
				tileOffsetY = Std.parseInt(child.get("y"));
			}
			if (child.nodeName == "image") {
				image = new TilesetImage(child.get("source"), child.get("trans"));
			}

			if (child.nodeName == "terraintypes") {
				for (element in child) {
					if (element.nodeName == "terrain") {
						terrainTypes.push(new TerrainType(element.get("name"), Std.parseInt(element.get("tile"))));
					}
				}
			}

			if (child.nodeName == "tile") {
				var id:Int = Std.parseInt(child.get("id"));
				var properties:Map<String, String> = new Map<String, String>();

				for (element in child) {
					if (element.nodeName == "properties") {
						for (property in element) {
							properties.set(property.get("name"), property.get("value"));
						}
					}
				}

				propertyTiles.set(id, new PropertyTile(id, properties));
			}
		}

		return new Tileset(tiledMap, name, tileWidth, tileHeight, spacing, properties, terrainTypes, image, new Vector2(tileOffsetX, tileOffsetY));
	}

	/** Returns the BitmapData of the given GID */
	public function getTileRectByGID(gid:Int):Rectangle {
		var texturePositionX:Float = getTexturePositionByGID(gid).x;
		var texturePositionY:Float = getTexturePositionByGID(gid).y;

		var spacingX:Float = 0;
		var spacingY:Float = 0;

		if (spacing > 0) {
			spacingX = texturePositionX + spacing;
			spacingY = texturePositionY + spacing;
		}

		var rect:Rectangle = new Rectangle((texturePositionX * this.tileWidth) + spacingX + offset.x, (texturePositionY * this.tileHeight) + spacingY
			+ offset.y, this.tileWidth, this.tileHeight);

		return rect;
	}

	/** Returns a Point which specifies the position of the gid in this tileset (Not in pixels!) */
	public function getTexturePositionByGID(gid:Int):Vector2 {
		var number = gid - this.firstGID;

		return new Vector2(getInnerTexturePositionX(number), getInnerTexturePositionY(number));
	}

	/** Returns the inner x-position of a texture with given tileNumber */
	private function getInnerTexturePositionX(tileNumber:Int):Int {
		return (tileNumber % Std.int(this.width / this.tileWidth));
	}

	/** Returns the inner y-position of a texture with given tileNumber */
	private function getInnerTexturePositionY(tileNumber:Int):Int {
		return Std.int(tileNumber / Std.int(this.width / this.tileWidth));
	}

	private function get_width():Int {
		return this.image.width;
	}

	private function get_height():Int {
		return this.image.height;
	}
}