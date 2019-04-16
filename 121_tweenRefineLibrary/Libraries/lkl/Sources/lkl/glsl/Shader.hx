package lkl.glsl;

import kha.Canvas;
import kha.Scheduler;
import kha.Shaders;
import kha.graphics4.BlendingFactor;
import kha.graphics4.ConstantLocation;
import kha.graphics4.VertexData;
import kha.graphics4.VertexStructure;
import kha.graphics4.PipelineState;
import kha.graphics4.FragmentShader;

import lkl.Object;

class Shader extends Object {
  var pipeline:PipelineState;
  public var shader:FragmentShader;
  public var timeID:ConstantLocation;

  public function new(shader:FragmentShader, shadertype:Int = 0){
    super();
    this.shader = shader;

    pipeline = new PipelineState();
    pipeline.fragmentShader = shader;

    var structure = new VertexStructure();
    structure.add('vertexPosition', VertexData.Float3);

    switch (shadertype){
      case 0:
        pipeline.vertexShader = Shaders.painter_colored_vert;
        structure.add('vertexColor', VertexData.Float4);

      case 1:
        pipeline.vertexShader = Shaders.painter_image_vert;
        structure.add('texPosition', VertexData.Float2);
        structure.add('vertexColor', VertexData.Float4);
    default: return;
    }

    pipeline.inputLayout = [structure];

    pipeline.blendSource = BlendingFactor.SourceAlpha;
    pipeline.blendDestination = BlendingFactor.InverseSourceAlpha;
    pipeline.alphaBlendSource = BlendingFactor.SourceAlpha;
    pipeline.alphaBlendDestination = BlendingFactor.InverseSourceAlpha;

    pipeline.compile();

    timeID = pipeline.getConstantLocation('u_time');
  }

  public function begin(canvas:Canvas){
    canvas.g2.pipeline = pipeline;
    pipeline.set();
    canvas.g4.setFloat(timeID, Scheduler.time());
  }

  public function end(canvas:Canvas){
    canvas.g2.pipeline = null;
  }
}