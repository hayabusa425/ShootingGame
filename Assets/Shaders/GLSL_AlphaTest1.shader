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
				vec2 p = (gl_FragCoord.xy * 2.0 - 512) / min(512, 512); // 正規化
				vec3 destColor1 = vec3(1.0, 0.3, 0.3);
    			float f = 0.0;
    			for(float i = 0.0; i < 10.0; i++){
        			float s = sin(t * (i + 0.5) * 0.628318) * 0.5;
        			float c = cos(t * (i + 0.5) * 0.628318) * 0.5;
        			f += 0.0025 / abs(length(p + vec2(c, s)) - 0.5);
    			}
    			gl_FragColor = vec4(vec3(destColor1 * f), 0.5);
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
                vec2 p = (gl_FragCoord.xy * 2.0 - 512) / min(512, 512); // 正規化
				vec3 destColor1 = vec3(1.0, 0.3, 0.3);
    			float f = 0.0;
    			for(float i = 0.0; i < 10.0; i++){
        			float s = sin(t * (i + 0.5) * 0.628318) * 0.5;
        			float c = cos(t * (i + 0.5) * 0.628318) * 0.5;
        			f += 0.0025 / abs(length(p + vec2(c, s)) - 0.5);
    			}
    			gl_FragColor = vec4(vec3(destColor1 * f), 0.5);
            }

            #endif

            ENDGLSL
        }
	}
}