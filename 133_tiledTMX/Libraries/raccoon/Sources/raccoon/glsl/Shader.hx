package raccoon.glsl;

import kha.Canvas;
import kha.Scheduler;
import kha.Shaders;
import kha.graphics4.BlendingFactor;
import kha.graphics4.ConstantLocation;
import kha.graphics4.VertexData;
import kha.graphics4.VertexStructure;
import kha.graphics4.PipelineState;
import kha.graphics4.FragmentShader;

import raccoon.Object;

class Shader extends Object {
  private var _pipeline:PipelineState;
  public var shader:FragmentShader;
  public var timeID:ConstantLocation;

  public function new(shader:FragmentShader, shadertype:Int = 0){
    super();
    this.shader = shader;

    _pipeline = new PipelineState();
    _pipeline.fragmentShader = shader;

    var structure = new VertexStructure();
    structure.add('vertexPosition', VertexData.Float3);

    switch (shadertype){
      case 0:
        _pipeline.vertexShader = Shaders.painter_colored_vert;
        structure.add('vertexColor', VertexData.Float4);

      case 1:
        _pipeline.vertexShader = Shaders.painter_image_vert;
        structure.add('texPosition', VertexData.Float2);
        structure.add('vertexColor', VertexData.Float4);
    default: return;
    }

    _pipeline.inputLayout = [structure];

    _pipeline.blendSource = BlendingFactor.SourceAlpha;
    _pipeline.blendDestination = BlendingFactor.InverseSourceAlpha;
    _pipeline.alphaBlendSource = BlendingFactor.SourceAlpha;
    _pipeline.alphaBlendDestination = BlendingFactor.InverseSourceAlpha;

    _pipeline.compile();

    timeID = _pipeline.getConstantLocation('u_time');
  }

  public function begin(canvas:Canvas){
    canvas.g2.pipeline = _pipeline;
    _pipeline.set();
    canvas.g4.setFloat(timeID, Scheduler.time());
  }

  public function end(canvas:Canvas){
    canvas.g2.pipeline = null;
  }
}