// Copyright (C) 2013 Christopher "Kasoki" Kaster
//
// This file is part of "openfl-tiled". <http://github.com/Kasoki/openfl-tiled>
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
package raccoon.tmx;

import kha.math.Vector2;

class TiledObject {
	/** The objectgroup this object belongs to */
	public var parent(default, null):TiledObjectGroup;

	/** A identification number, which represents a part of the tileset. */
	public var gid(default, null):Int;

	/** The name of this object */
	public var name(default, null):String;

	/** The type of this object */
	public var type(default, null):String;

	/** The x coordinate of this object (in pixels!) */
	public var x(default, null):Int;

	/** The y coordinate of this object (in pixels!) */
	public var y(default, null):Int;

	/** The width of this object in pixels */
	public var width(default, null):Int;

	/** The width of this object in pixels */
	public var height(default, null):Int;

	/** Checks if this object has a polygons */
	public var hasPolygon(get, null):Bool;

	/** Check if this object has a polylines */
	public var hasPolyline(get, null):Bool;

	/** The polygon of this object. Default: null */
	public var polygon(default, null):TiledPolygon;

	/** The polyline of this object. Default:null */
	public var polyline(default, null):TiledPolyline;

	/** Contains all properties from this object */
	public var properties(default, null):Map<String, String>;

	private function new(parent:TiledObjectGroup, gid:Int, name:String, type:String, x:Int, y:Int, width:Int, height:Int, polygon:TiledPolygon,
			polyline:TiledPolyline, properties:Map<String, String>) {
		this.parent = parent;
		this.gid = gid;
		this.name = name;
		this.type = type;
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
		this.polygon = polygon;
		this.polyline = polyline;
		this.properties = properties;
	}

	/** Creates a new TiledObject-instance from the given Xml code. */
	public static function fromGenericXml(xml:Xml, parent:TiledObjectGroup):TiledObject {
		var gid:Int = xml.get("gid") != null ? Std.parseInt(xml.get("gid")) : 0;
		var name:String = xml.get("name");
		var type:String = xml.get("type");
		var x:Int = Std.parseInt(xml.get("x"));
		var y:Int = Std.parseInt(xml.get("y"));
		var width:Int = Std.parseInt(xml.get("width"));
		var height:Int = Std.parseInt(xml.get("height"));
		var polygon:TiledPolygon = null;
		var polyline:TiledPolyline = null;
		var properties:Map<String, String> = new Map<String, String>();

		for (child in xml) {
			if (Helper.isValidElement(child)) {
				if (child.nodeName == "properties") {
					for (property in child) {
						if (Helper.isValidElement(property)) {
							properties.set(property.get("name"), property.get("value"));
						}
					}
				}

				if (child.nodeName == "polygon" || child.nodeName == "polyline") {
					var origin:Vector2 = new Vector2(x, y);
					var points:Array<Vector2> = new Array<Vector2>();

					var pointsAsString:String = child.get("points");

					var pointsAsStringArray:Array<String> = pointsAsString.split(" ");

					for (p in pointsAsStringArray) {
						var coords:Array<String> = p.split(",");
						points.push(new Vector2(Std.parseInt(coords[0]), Std.parseInt(coords[1])));
					}

					if (child.nodeName == "polygon") {
						polygon = new TiledPolygon(origin, points);
					} else if (child.nodeName == "polyline") {
						polyline = new TiledPolyline(origin, points);
					}
				}
			}
		}

		return new TiledObject(parent, gid, name, type, x, y, width, height, polygon, polyline, properties);
	}

	private function get_hasPolygon():Bool {
		return this.polygon != null;
	}

	private function get_hasPolyline():Bool {
		return this.polyline != null;
	}
}