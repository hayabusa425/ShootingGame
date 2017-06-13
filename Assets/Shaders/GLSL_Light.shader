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
float t = _Time.y / 2.0;
void main()
{	
	vec2 p = (gl_FragCoord.xy * 2.0 - 512) / min(512, 512); // 正規化
	vec3 destColor1 = vec3(0.3, 1.0, 0.3);
    float f = 0.0;
    for(float i = 0.0; i < 10.0; i++){
        float s = sin(t * (i + 1.0) * 0.628318) * 0.5;
        float c = cos(t * (i + 1.0) * 0.628318) * 0.5;
        f += 0.0025 / abs(length(p + vec2(c, s)) - 0.5);
    }
    gl_FragColor = vec4(vec3(destColor1 * f), 1.0);
}
#endif

			ENDGLSL
		}
	}
}