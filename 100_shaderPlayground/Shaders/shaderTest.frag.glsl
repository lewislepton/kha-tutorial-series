#version 450

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

out vec4 fragColor;

void main(){
	fragColor = vec4(1.0, sin(u_time * 2.6), cos(u_time * 1.9), 1.0);
}