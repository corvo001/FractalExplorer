Shader "Custom/Julia"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Zoom ("Zoom", Float) = 1.0
        _Offset ("Offset", Vector) = (0,0,0,0)
        _C ("C", Vector) = (-0.7, 0.27015, 0, 0)
        _Iterations ("Iterations", Float) = 100
        _GlowIntensity ("Glow Intensity", Float) = 1.0
        _Saturation ("Saturation", Float) = 1.0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata { float4 vertex : POSITION; float2 uv : TEXCOORD0; };
            struct v2f { float2 uv : TEXCOORD0; float4 vertex : SV_POSITION; };

            sampler2D _MainTex;
            float _Zoom;
            float4 _Offset;
            float4 _C;
            float _Iterations;
            float _GlowIntensity;
            float _Saturation;

            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                float2 uv = (i.uv - 0.5) * _Zoom + _Offset.xy;
                float2 z = uv;
                float2 c = _C.xy;

                int n = 0;
                for (int j = 0; j < _Iterations; j++)
                {
                    float x = z.x * z.x - z.y * z.y + c.x;
                    float y = 2.0 * z.x * z.y + c.y;
                    z = float2(x, y);
                    if (dot(z, z) > 4.0) break;
                    n++;
                }

                float color = n / _Iterations;
                float glow = pow(color, _GlowIntensity);
                float3 col = lerp(float3(0.0, 0.2, 1.0), float3(1.0, 0.5, 0.0), glow) * _Saturation;

                return fixed4(col, 1.0);
            }
            ENDCG
        }
    }
}