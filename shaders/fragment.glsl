uniform float time;
uniform float progress;
uniform sampler2D texture1;
uniform vec4 resolution;
uniform vec2 pixels;
varying vec2 vUv;
varying vec2 vUv1;
uniform vec2 mouse;
uniform float velocity;

varying vec2 uvRate2;

varying vec3 vPosition;
float PI = 3.1415926;

vec2 mirrored(vec2 v ) {
	vec2 m = mod(v,2.);
	return mix(m, 2.0 - m, step(1.0, m));
}


void main() {
	vec2 uv = gl_FragCoord.xy/pixels.xy;

	vec2 uv1 = vUv1;

	uv1.y += sin(uv1.y * 5. + time) * 0.002;
	uv1.x += sin(uv1.x * 10. + time * 0.5) * 0.002;

	float dist = distance(vec2(mouse.x, ((1. - mouse.y ) - 0.5) * uvRate2.y + 0.5), vUv1);

	uv1.x = (uv1.x - 0.5) / (1. - progress) + 0.5;


	if(dist < 0.2) {
		// tex = vec4(1., 0.,0.,1.);
	 
		float temp = dist / 0.2;
		float abs = 1. - temp;
 
		uv1.x += sin(gl_FragCoord.y * 0.03 + time) * abs * 0.003 * velocity;
		uv1.y += sin(gl_FragCoord.x * 0.03 + time * 0.5) * abs * 0.003 * velocity;



		uv1.x += sin(gl_FragCoord.y * 0.07 + time) * abs * 0.003 * velocity;
		uv1.y += sin(gl_FragCoord.x * 0.08 + time * 0.5) * abs * 0.004 * velocity;




	}
  	vec4 tex = texture2D(texture1, mirrored(uv1));
	if(dist < 0.2) {
		tex *= 1. + (1. - dist / 0.2);
	}




  
	gl_FragColor = tex;
}