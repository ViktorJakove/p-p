varying mediump vec2 var_texcoord0;
varying lowp vec4 var_color;

const mediump float HOWFAR = 0.35;

void main()
{
	mediump float d = abs(var_texcoord0.y - 0.5) * 2.0;
	mediump float a = smoothstep(1.0 - HOWFAR, 1.0, d);
	a = a * a;
	gl_FragColor = vec4(0.0, 0.0, 0.0, a * var_color.a);
}
