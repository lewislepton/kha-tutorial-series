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

class Project {
	var backbuffer:Image;
	var pipeline:PipelineState;

	var resolution:FastVector2;
	var mouse:FastVector2;

	var resolutionID:ConstantLocation;
	var mouseID:ConstantLocation;
	var timeID:ConstantLocation;

	public function new(){
		backbuffer = Image.createRenderTarget(Main.WIDTH, Main.HEIGHT);

		setupShader();

		resolution = new FastVector2(Main.WIDTH, Main.HEIGHT);
		mouse = new FastVector2();

		Mouse.get().notify(onMouseDown, onMouseUp, onMouseMove, null);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		backbuffer.g2.begin();
		backbuffer.g2.pipeline = pipeline;
		backbuffer.g4.setVector2(resolutionID, resolution);
		backbuffer.g4.setVector2(mouseID, mouse);
		backbuffer.g4.setFloat(timeID, Scheduler.time());

		backbuffer.g2.fillRect(0, 0, Main.WIDTH, Main.HEIGHT);
		backbuffer.g2.pipeline = null;
		backbuffer.g2.end();

		framebuffer.g2.begin();
		Scaler.scale(backbuffer, framebuffer, System.screenRotation);
		framebuffer.g2.end();
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
	}
}