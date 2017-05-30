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
uniform vec4 _SinTime;
void main()
{
	//gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
	gl_FragColor = _SinTime;
}
#endif

			ENDGLSL
		}
	}
}
