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
float x = _ScreenParams.x;
float y = _ScreenParams.y;
void main()
{	
	//float a = gl_FragCoord.x / 512.0;
	//float b = gl_FragCoord.y / 512.0;
	//gl_FragColor = vec4(a, b, 0.0, 1.0);

	if(gl_FragCoord.x == (x / 2.0)){
		gl_FragColor = (1.0, 1.0, 1.0, 1.0);
	}
	else{
		gl_FragColor = (0.0, 0.0, 0.0, 1.0);
	}

}
#endif

			ENDGLSL
		}
	}
}