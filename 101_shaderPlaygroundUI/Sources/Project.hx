package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.Scheduler;
import kha.Scaler;
import kha.Shaders;
import kha.System;
import kha.Image;
import kha.input.Mouse;
import kha.math.FastVector2;
import kha.graphics4.PipelineState;
import kha.graphics4.VertexData;
import kha.graphics4.VertexStructure;
import kha.graphics4.ConstantLocation;
import kha.graphics2.Graphics;

import zui.Zui;
import zui.Id;

class Project {
	var backbuffer:Image;
	var pipeline:PipelineState;

	var resolution:FastVector2;
	var mouse:FastVector2;

	var resolutionID:ConstantLocation;
	var mouseID:ConstantLocation;
	var timeID:ConstantLocation;

	var ui:Zui;

	var red:Float;
	var green:Float;
	var blue:Float;

	var redID:ConstantLocation;
	var greenID:ConstantLocation;
	var blueID:ConstantLocation;

	public function new(){
		backbuffer = Image.createRenderTarget(Main.WIDTH, Main.HEIGHT);

		ui = new Zui({font:Assets.fonts.arial});

		setupShader();

		resolution = new FastVector2(Main.WIDTH, Main.HEIGHT);
		mouse = new FastVector2();

		Mouse.get().notify(onMouseDown, onMouseUp, onMouseMove, null);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		
		backbuffer.g4.begin();
		backbuffer.g4.setPipeline(pipeline);
		
		backbuffer.g4.setVector2(resolutionID, resolution);
		backbuffer.g4.setVector2(mouseID, mouse);
		backbuffer.g4.setFloat(timeID, Scheduler.time());

		backbuffer.g4.setFloat(redID, red);
		backbuffer.g4.setFloat(greenID, green);
		backbuffer.g4.setFloat(blueID, blue);
		backbuffer.g4.end();


		backbuffer.g2.begin();
		backbuffer.g2.pipeline = pipeline;
		backbuffer.g2.fillRect(0, 0, Main.WIDTH, Main.HEIGHT);
		backbuffer.g2.end();
		

		framebuffer.g2.begin();
		Scaler.scale(backbuffer, framebuffer, System.screenRotation);
		framebuffer.g2.end();

		gui(framebuffer.g2);
	}

	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		mouse.x = x;
		mouse.y = y;
	}

	public function onMouseUp(button:Int, x:Int, y:Int):Void {
		mouse.x = x;
		mouse.y = y;
	}

	public function onMouseMove(x:Int, y:Int, mx:Int, my:Int):Void {
		mouse.x = x;
		mouse.y = y;
	}

	function setupShader(){
		pipeline = new PipelineState();
		pipeline.vertexShader = Shaders.painter_colored_vert;
		pipeline.fragmentShader = Shaders.shaderTest_frag;

		var structure = new VertexStructure();
		structure.add('vertexPosition', VertexData.Float3);
		structure.add('vertexColor', VertexData.Float4);

		pipeline.inputLayout = [structure];

		pipeline.compile();

		resolutionID = pipeline.getConstantLocation('u_resolution');
		mouseID = pipeline.getConstantLocation('u_mouse');
		timeID = pipeline.getConstantLocation('u_time');

		redID = pipeline.getConstantLocation('u_red');
		greenID = pipeline.getConstantLocation('u_green');
		blueID = pipeline.getConstantLocation('u_blue');
	}

	public function gui(graphics:Graphics){
		ui.begin(graphics);
		if (ui.window(Id.handle(), 0, 0, 128, 128)){
			if (ui.panel(Id.handle(), 'controls')){
				red = ui.slider(Id.handle(), 'red', 0, 1, true, 100);
				green = ui.slider(Id.handle(), 'green', 0, 1, true, 100);
				blue = ui.slider(Id.handle(), 'blue', 0, 1, true, 100);
			}
		}
		ui.end();
	}
}
