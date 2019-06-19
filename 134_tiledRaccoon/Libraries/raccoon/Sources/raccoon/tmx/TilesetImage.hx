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

import kha.Image;

class TilesetImage {
	/** The filepath where this image is */
	public var source(default, null):String;

	/** The filename */
	public var fileName(default, null):String;

	/** The width of this image */
	public var width(get, null):Int;

	/** The height of this image */
	public var height(get, null):Int;

	/** The image as BitmapData */
	public var texture(default, null):Image;

	public function new(source:String, trans:String) {
		this.source = source;
		// get fileName from path
		this.fileName = source.substr(source.lastIndexOf("/") + 1, source.length);

		var useTransparentColor = false;
		var threshold:UInt = -1;
		var transparent:UInt = 0x00000000;

		if (trans != null) {
			useTransparentColor = true;

			// insert hex prefix and 255 alpha
			trans = "0xff" + trans;

			threshold = Std.parseInt(trans);
		}

		// load image
		this.texture = Helper.getImage(this.source);

		/*if(useTransparentColor) {
			var rect = new Rectangle(0, 0, this.texture.width, this.texture.height);
			var point = new Point(0, 0);

			this.texture.threshold(this.texture, rect, point, "==",
				threshold, transparent, 0xFFFFFFFF, true);
		}*/
	}

	private function get_width():Int {
		return this.texture.width;
	}

	private function get_height():Int {
		return this.texture.height;
	}
}