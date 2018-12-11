#version 450

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

uniform float u_red;
uniform float u_green;
uniform float u_blue;

out vec4 fragColor;

void main(){
	fragColor = vec4(u_red, u_green, u_blue, 1.0);
}