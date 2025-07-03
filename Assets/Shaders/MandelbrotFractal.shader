Shader "Custom/Mandelbrot"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Zoom ("Zoom", Float) = 1.0
        _Offset ("Offset", Vector) = (0,0,0,0)
        _Iterations ("Iterations", Float) = 100
        _ColorShift ("Color Shift", Float) = 0.0
        _ColorStrength ("Color Strength", Float) = 1.0
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

            float _Zoom;
            float4 _Offset;
            float _Iterations;
            float _ColorShift;
            float _ColorStrength;

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
                float2 c = uv;
                float2 z = float2(0.0, 0.0);
                int n = 0;

                for (int i = 0; i < _Iterations; i++)
                {
                    float x = z.x * z.x - z.y * z.y + c.x;
                    float y = 2.0 * z.x * z.y + c.y;
                    z = float2(x, y);
                    if (dot(z, z) > 4.0) break;
                    n++;
                }

                float color = n / _Iterations;
                float r = abs(sin(color * 6.2831 + _ColorShift)) * _ColorStrength;
                float g = abs(sin(color * 3.1415 + _ColorShift * 0.5)) * _ColorStrength;
                float b = abs(sin(color * 9.4247 + _ColorShift * 1.5)) * _ColorStrength;
                return fixed4(r, g, b, 1.0);
            }
            ENDCG
        }
    }
}