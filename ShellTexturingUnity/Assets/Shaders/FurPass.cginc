#pragma target 3.0

#define LAYER_HEIGHT (PASS_INDEX * 1/19.0)
#define MAX_BEND .1
#define OFFSET_FUNCTION nop // options are nop, sqr, sqrt

// 10 is good for wavy fur, 0 is still
#define ANIMATION_FREQUENCY 0

#define SUPPORT_THICKNESS_TAPERING // Optional
//#define SUPPORT_ALPHA_TAPERING // Optional

#ifdef TEXTURE_3D

sampler3D _MainTex;

#else

sampler2D _MainTex;
sampler2D _Alpha;
float4 _Alpha_ST;
float _Thickness = 1;
float _TaperDistance = 1;
float _Bend;

#endif

uniform float _MaxFurLength;
uniform float _FurLength;

#ifdef FANCY

sampler2D _ColorRamp;
sampler2D _ColorLerpRamp;
sampler2D _AlphaRamp;
sampler2D _ViewAngleRamp;

#endif

float nop(float x)
{
	return x;
}

float hash(float2 p)
{
	return frac(sin(dot(p, float2(127.1, 311.7))) * 43758.5453);
}

float sqr(float x)
{
	return x * x;
}

#ifdef TEXTURE_3D

void vert(inout appdata_full v)
{
	v.vertex.xyz += (v.normal) * _FurLength * OFFSET_FUNCTION(LAYER_HEIGHT) * _MaxFurLength;
}

#else
void vert(inout appdata_full v)
{
	float2 uv = v.texcoord.xy / 10000;
	float angle = 0.1; //hash(uv) * 6.2831853; // 2 * PI to get a full circle 
	float3 tangent = normalize(v.tangent.xyz);
	float3 bitangent = cross(v.normal, tangent) * v.tangent.w;
	float3 offsetDir = cos(angle) * tangent + sin(angle) * bitangent;

	v.vertex.xyz +=
		(v.normal) * _FurLength * OFFSET_FUNCTION(LAYER_HEIGHT) * _MaxFurLength
		+ offsetDir * 2 * cos(ANIMATION_FREQUENCY * (LAYER_HEIGHT + _Time.y)) * LAYER_HEIGHT * _Bend * MAX_BEND;
}
#endif

struct Input
{
	float2 uv_MainTex;
	float3 viewDir;
};

#ifdef FANCY
void surf(Input IN, inout SurfaceOutputStandard o)
{
	float3 viewDir = normalize(IN.viewDir);
	float3 normal = normalize(o.Normal);
	float viewAngle = dot(viewDir, normal);
	float4 viewAngleColor = tex2D(_ViewAngleRamp, float2(viewAngle, 0.5));

	fixed4 color = tex2D(_MainTex, IN.uv_MainTex) * viewAngleColor;
	fixed4 colorRamp = tex2D(_ColorRamp, float2(LAYER_HEIGHT, 0.5));
	float colorLerp = tex2D(_ColorLerpRamp, float2(LAYER_HEIGHT, 0.5)).r;

	float2 uv = IN.uv_MainTex * _Alpha_ST.xy + _Alpha_ST.zw;
	fixed4 alpha = tex2D(_Alpha, uv);

	float thickNess = _Thickness;
	float alphaMultiplier = tex2D(_AlphaRamp, float2(LAYER_HEIGHT, 0.5)).r;

	thickNess = lerp(_Thickness, 0, LAYER_HEIGHT);

	alpha = step(1 - alpha, thickNess);
	o.Albedo = lerp(color.rgb, colorRamp.rgb, colorLerp.r);
	o.Alpha = alpha.r * alphaMultiplier;
}
#else
#ifdef TEXTURE_3D
void surf(Input IN, inout SurfaceOutputStandard o)
{
	float2 uv = IN.uv_MainTex;
	float3 uvw = float3(uv.x, LAYER_HEIGHT, uv.y);
	fixed4 color = tex3D(_MainTex, uvw);
	o.Albedo = color.rgb;
	o.Alpha = color.a;
}
#else
void surf(Input IN, inout SurfaceOutputStandard o)
{
	fixed4 color = tex2D(_MainTex, IN.uv_MainTex);

	float2 uv = IN.uv_MainTex * _Alpha_ST.xy + _Alpha_ST.zw;
	fixed4 alpha = tex2D(_Alpha, uv);
	float thickNess = _Thickness;
	float alphaMultiplier = 1;

	if (LAYER_HEIGHT > _TaperDistance)
	{
		float t = (LAYER_HEIGHT - _TaperDistance) / (1 - _TaperDistance);
		#ifdef SUPPORT_ALPHA_TAPERING
		alphaMultiplier = 1 - t;
		#endif

		#ifdef SUPPORT_THICKNESS_TAPERING
		thickNess = lerp(_Thickness, 0, t);
		#endif
	}

	alpha = step(1 - alpha, thickNess);
	o.Albedo = color.rgb; //float3(alphaMultiplier, 0, 0);
	o.Alpha = alpha.r * alphaMultiplier;
}
#endif
#endif
