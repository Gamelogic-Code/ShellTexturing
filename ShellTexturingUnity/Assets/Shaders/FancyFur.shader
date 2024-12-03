Shader "Gamelogic/Fx/Fancy Fur"
{
	Properties
	{
		_MainTex ("Albedo (RGB)", 2D) = "white" 
		_Alpha ("Alpha", 2D) = "white" {}
		_MaxFurLength("Max Fur Length", Range(.0002, 5)) = 1
		_FurLength("Fur Length", Range(.0002, 1)) = .25
		
		_Thickness("Tickness", Range(0, 1)) = 0.5
		_TaperDistance("Taper Distance", Range(0, 1)) = 0.5
		_Bend("Bend", Range(0, 1)) = 0.5
		_ColorRamp("Color Ramp", 2D) = "white" {}
		_ColorLerpRamp("Color Lerp Ramp", 2D) = "black" {}
		_AlphaRamp("Alpha Ramp", 2D) = "white" {}
		
		_ViewAngleRamp("View Angle Ramp", 2D) = "white" {}
	}
	SubShader
	{
		Tags
		{
			"RenderType"="Opaque"
		}
		LOD 200

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows
		#pragma target 3.0

		sampler2D _MainTex;
		sampler2D _Alpha;

		struct Input
		{
			float2 uv_MainTex; 
		};

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 0
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 1
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 2
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 3
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 4
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 5
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 6
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 7
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 8
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 9
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 10
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 11
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 12
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 13
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 14
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 15
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 16
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 17
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 18
		#define FANCY
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 19
		#define FANCY
		#include "FurPass.cginc"
		ENDCG
	}
	FallBack "Diffuse"
}
