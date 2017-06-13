Shader "Custom/GLSL Shader" {
	SubShader {
		Pass {
			//最初のパスは背面のみレンダリング。つまり内側。
            Cull Front

            //他のオブジェクトをはじかないように深度バッファの書き込みをしない
            ZWrite Off

			//アルファブレンディングを使う
			Blend SrcAlpha OneMinusSrcAlpha 
			GLSLPROGRAM

#ifdef VERTEX
void main()
{
	gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
}
#endif

#ifdef FRAGMENT
uniform vec4 _Time;
float t = _Time.y;
void main()
{	
	vec2 p = (gl_FragCoord.xy * 2.0 - 512) / min(512, 512);
	vec3 destColor = vec3(0.0);
    for(float i = 0.0; i < 5.0; i++){
        float j = i + 1.0;
        vec2 q = p + vec2(cos(t * j), sin(t * j)) * 0.5;
        destColor += 0.05 / length(q);
    }
    gl_FragColor = vec4(destColor, 0.5);
}
#endif

			ENDGLSL
		}
		Pass {
            //二回目のパスは表のみレンダリング
            Cull Back

            ZWrite Off

            Blend SrcAlpha OneMinusSrcAlpha

            GLSLPROGRAM

            #ifdef VERTEX

            void main()
            {
                gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
            }

            #endif

            #ifdef FRAGMENT
            uniform vec4 _Time;
			float t = _Time.y;
            void main()
            {
                vec2 p = (gl_FragCoord.xy * 2.0 - 512) / min(512, 512);
    			vec3 destColor = vec3(0.0);
    			for(float i = 0.0; i < 5.0; i++){
        			float j = i + 1.0;
        			vec2 q = p + vec2(cos(t * j), sin(t * j)) * 0.5;
        			destColor += 0.05 / length(q);
    			}
    			gl_FragColor = vec4(destColor, 0.5);
            }

            #endif

            ENDGLSL
        }
	}
}