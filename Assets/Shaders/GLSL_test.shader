Shader "Custom/GLSL Shader" {
	SubShader {
		Pass {
			GLSLPROGRAM

#ifdef VERTEX
void main()
{
	gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
}
#endif

#ifdef FRAGMENT
uniform vec4 _Time;
uniform vec4 _ScreenParams;
float t = _Time.y;
void main()
{	
	//float a = gl_FragCoord.x / 512.0;
	//float b = gl_FragCoord.y / 512.0;
	//gl_FragColor = vec4(a, b, 0.0, 1.0);

	float r = abs(sin(t));
	float g = abs(cos(t));
	float b = (r + g) / 2.0;
	gl_FragColor = vec4(r, g, b, 1.0);

}
#endif

			ENDGLSL
		}
	}
}