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

class TiledObjectGroup {
	/** The name of this ObjectGroup */
	public var name(default, null):String;

	/** The color of this ObjectGroup */
	public var color(default, null):String;

	/** The width of this ObjectGroup */
	public var width(default, null):Int;

	/** The height of this ObjectGroup */
	public var height(default, null):Int;

	/** All properties this ObjectGroup contains */
	public var properties(default, null):Map<String, String>;

	/** All objects which are in this ObjectGroup */
	public var objects(default, null):Array<TiledObject>;

	private var objectCounter:Int;

	private function new(name:String, color:String, width:Int, height:Int, properties:Map<String, String>, xmlObjects:Array<Xml>) {
		this.name = name;
		this.color = color;
		this.width = width;
		this.height = height;
		this.properties = properties;

		this.objects = new Array<TiledObject>();

		for (xml in xmlObjects) {
			this.objects.push(TiledObject.fromGenericXml(xml, this));
		}

		this.objectCounter = 0;
	}

	/** Generates a new ObjectGroup from the given Xml code */
	public static function fromGenericXml(xml:Xml):TiledObjectGroup {
		var name = xml.get("name");
		var color = xml.get("color");
		var width = Std.parseInt(xml.get("width"));
		var height = Std.parseInt(xml.get("height"));
		var properties:Map<String, String> = new Map<String, String>();
		var objects:Array<Xml> = new Array<Xml>();

		for (child in xml.elements()) {
			if (child.nodeName == "properties") {
				for (property in child) {
					if (property.exists("name")) {
						properties.set(property.get("name"), property.get("value"));
					}
				}
			}

			if (child.nodeName == "object") {
				objects.push(child);
			}
		}

		return new TiledObjectGroup(name, color, width, height, properties, objects);
	}

	public function hasNext():Bool {
		if (objectCounter < objects.length) {
			return true;
		} else {
			objectCounter = 0;
			return false;
		}
	}

	public function next():TiledObject {
		return objects[objectCounter++];
	}
}