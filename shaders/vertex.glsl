uniform float time;
varying vec2 vUv;
varying vec3 vPosition;
uniform vec2 pixels;
uniform vec3 uMin;
varying vec2 vUv1;
uniform vec2 uvRate1;
varying vec2 uvRate2;

float PI = 3.1415926;
void main () {
	vUv = uv;
	uvRate2 = uvRate1;
	vec2 _uv = uv - 0.5;
	vUv1 = _uv;
	vUv1 *= uvRate1.xy;
	vUv1 += 0.5;
	gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}