Shader "Gamelogic/Fx/Fur 3D"
{
	Properties
	{
		_MainTex ("Albedo (RGB)", 3D) = "white" {}
		_MaxFurLength("Max Fur Length", Range(.0002, 5)) = 1
		_FurLength("Fur Length", Range(.0002, 1)) = .25
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

		sampler3D _MainTex;
		
		struct Input
		{
			float2 uv_MainTex; 
		};

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 c = tex3D(_MainTex, float3(IN.uv_MainTex.x, 0.0, IN.uv_MainTex.y));
			o.Albedo = c;
			o.Alpha = c.a;
		}
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 0
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 1
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 2
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 3
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 4
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 5
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 6
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 7
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 8
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 9
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 10
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 11
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 12
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 13
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 14
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 15
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 16
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 17
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 18
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows alpha:blend vertex:vert
		#define PASS_INDEX 19
		#define TEXTURE_3D
		#include "FurPass.cginc"
		ENDCG
	}
	FallBack "Diffuse"
}
