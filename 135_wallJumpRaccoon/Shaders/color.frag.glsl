#version 450

in vec4 fragmentColor;
uniform float u_time;
out vec4 fragColor;

void main(){
  vec4 texcolor = vec4(fragmentColor) * fragmentColor;
  texcolor.r += sin(u_time / 3.0);
  texcolor.g += cos(u_time / 0.3);
  texcolor.b += sin(u_time / 1.0);
  texcolor.a += 1.0;

  fragColor = texcolor;
}