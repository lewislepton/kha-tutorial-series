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
// ======================================================================
// This file contains code from the HaxePunk project
// Link to HaxePunk: <http://haxepunk.com>
// Link to related file: <https://github.com/HaxePunk/tiled/blob/master/com/haxepunk/tmx/TmxLayer.hx>
package raccoon.tmx;

class Layer {
	/** The name of this layer */
	public var name(default, null):String;

	/** The width of this layer in tiles */
	public var width(default, null):Int;

	/** The height of this layer in tiles */
	public var height(default, null):Int;

	/** The opacity of an layer */
	public var opacity(default, null):Float;

	/** Is the layer visible? */
	public var visible(default, null):Bool;

	/** All tiles which this Layer contains */
	public var tiles(default, null):Array<Tile>;

	/** The parent TiledMap */
	public var parent(default, null):TiledMap;

	/** get the tileGIDs **/
	// public var tileGIDs(default, null):Array<Int>;

	private function new(parent:TiledMap, name:String, width:Int, height:Int, opacity:Float, visible:Bool, tiles:Array<Int>) {
		this.parent = parent;
		this.name = name;
		this.width = width;
		this.height = height;
		this.opacity = opacity;
		this.visible = visible;

		this.tiles = new Array<Tile>();
		for (gid in tiles) {
			this.tiles.push(Tile.fromGID(gid, this));
		}
	}

	/**
	 * This method generates a new Layer from the given Xml code
	 * @param xml The given xml code
	 * @param
	 * @return A new layer
	 */
	public static function fromGenericXml(xml:Xml, parent:TiledMap):Layer {
		var name:String = xml.get("name");
		var width:Int = Std.parseInt(xml.get("width"));
		var height:Int = Std.parseInt(xml.get("height"));
		var opacity:Float = Std.parseFloat(xml.get("opacity") != null ? xml.get("opacity") : "1.0");
		var visible:Bool = xml.get("visible") == null ? true : Std.parseInt(xml.get("visible")) == 1 ? true : false;

		var tileGIDs = new Array<Int>();

		for (child in xml.elements()) {
			if (child.nodeName == "data") {
				var encoding:String = "";
				if (child.exists("encoding")) {
					encoding = child.get("encoding");
				}
				var chunk:String = "";
				switch (encoding) {
					case "base64":
						/*chunk = child.firstChild().nodeValue;
							var compressed:Bool = false;
							if (child.exists("compression")){
								switch(child.get("compression")){
									case "zlib":
										compressed = true;
									default:
										throw "TiledMap: data compression type not supported!";
								}
							}
							tileGIDs = base64ToArray(chunk, width, compressed); */
						throw "kha-tiled: base64 not supported at the moment";
					case "csv":
						chunk = child.firstChild().nodeValue;
						tileGIDs = csvToArray(chunk);
					default:
						for (tile in child) {
							var gid = Std.parseInt(tile.get("gid"));
							tileGIDs.push(gid);
						}
				}
			}
		}

		return new Layer(parent, name, width, height, opacity, visible, tileGIDs);
	}

	/**
	 * This method generates a version of this layer in CSV
	 * @param ?width [OPTIONAL] The number of tiles in width. Default: The layer width.
	 * @return A string which contains CSV
	 */
	public function toCSV(?width:Int):String {
		if (width <= 0 || width == null) {
			width = this.width;
		}

		var counter:Int = 0;
		var csv:String = "";

		for (tile in this.tiles) {
			var tileGID = tile.gid;

			if (counter >= width) {
				// remove the last ","
				csv = csv.substr(0, csv.length - 1);

				// add a new line and reset counter
				csv += '\n';
				counter = 0;
			}

			csv += tileGID;
			csv += ',';

			counter++;
		}

		// remove the last ","
		csv = csv.substr(0, csv.length - 1);

		return csv;
	}

	private static function csvToArray(input:String):Array<Int> {
		var result:Array<Int> = new Array<Int>();
		var rows:Array<String> = StringTools.trim(input).split("\n");
		var row:String;

		for (row in rows) {
			if (row == "") {
				continue;
			}

			var resultRow:Array<Int> = new Array<Int>();
			var entries:Array<String> = row.split(",");
			var entry:String;

			for (entry in entries) {
				if (entry != "") {
					result.push(Std.parseInt(entry));
				}
			}
		}
		return result;
	}
	/*private static function base64ToArray(chunk:String, lineWidth:Int, compressed:Bool):Array<Int>{
			var result:Array<Int> = new Array<Int>();
			var data:ByteArray = base64ToByteArray(chunk);

			if(compressed)
				#if js
					throw "No support for compressed maps in html5 target!";
				#end
				#if !js
					data.uncompress();
				#end
			data.endian = Endian.LITTLE_ENDIAN;

			while(data.position < data.length){
				result.push(data.readInt());
			}
			return result;
		}

		private static inline var BASE64_CHARS:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";

		private static function base64ToByteArray(data:String):ByteArray{
			var output:ByteArray = new ByteArray();

			//initialize lookup table
			var lookup:Array<Int> = new Array<Int>();
			var c:Int;
			for (c in 0...BASE64_CHARS.length){
				lookup[BASE64_CHARS.charCodeAt(c)] = c;
			}

			var i:Int = 0;

			while (i < data.length - 3) {
				// Ignore whitespace
				if (data.charAt(i) == " " || data.charAt(i) == "\n"){
					i++; continue;
				}

				//read 4 bytes and look them up in the table
				var a0:Int = lookup[data.charCodeAt(i)];
				var a1:Int = lookup[data.charCodeAt(i + 1)];
				var a2:Int = lookup[data.charCodeAt(i + 2)];
				var a3:Int = lookup[data.charCodeAt(i + 3)];

				// convert to and write 3 bytes
				if(a1 < 64)
					output.writeByte((a0 << 2) + ((a1 & 0x30) >> 4));
				if(a2 < 64)
					output.writeByte(((a1 & 0x0f) << 4) + ((a2 & 0x3c) >> 2));
				if(a3 < 64)
					output.writeByte(((a2 & 0x03) << 6) + a3);

				i += 4;
			}

			// Rewind & return decoded data
			output.position = 0;
			return output;
	}*/
}