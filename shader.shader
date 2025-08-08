Shader "ZZZ/AvatarUI"
{
    Properties
    {
      [KeywordEnum(None, Face, Eye, Body)] _Domain("Domain" , Float) = 0
      
      [Header(Main Maps)]_Color("Color",Color)=(1,1,1,1)
      [NoScaleOffset]_MainTex("Texture",2D)="white"{}
      [NoScaleOffset]_LightTex("Light Tex",2D)="linearGray"{ }
      [NoScaleOffset]_OtherDataTex("Other Data Tex",2D)="white" { }
      [NoScaleOffset]_OtherDataTex2("Other Data Tex",2D)="white"{ }
     
      _NoseLineHoriDisp("Hori Disappear Value",Range(0.85,0.98))=0.92
      _NoseLineLkDnDisp("LookDown Disappear Value",Range(0.5,0.7))= 0.62
     
      _AlphaClip("Alpha clipping",Range(0,1))= 0.333
      
      _BumpScale("Normal Scale",Range(-5, 5))=1
      _Glossiness("Smoothness",Range(0,1))=0.5  
      _Metallic("Metallic",Range(0,1))=0.0
      
      [HideInInspector]_HeadCenter  ("Head Center",Vector)=(0,0,0)
      [HideInInspector]_HeadForward ("Head Forward",Vector)=(0,0,0)
      [HideInInspector]_HeadRight   ("Head Right",Vector)=(0,0,0)
      _HeadSphereRange ("Head Sphere Range",Range(0,1))=0
      
      AmbientColorIntensity("Ambient Intensity",Range(0,1))= 0.333
      
      [Enum(s0,0,s1,1,s2,2,s3,3,s4,4,s5,5)]_SkinMatId("SkinMatId",Float)= 0
      
      _Modelsize ("Model size 1",Range(0,100))=1
      _Modelsize2("Model size 2",Range(0,100))=1
      _Modelsize3("Model size 3",Range(0,100))=1
      _Modelsize4("Model size 4",Range(0,180))=1
      _Modelsize5("Model Size 5",Range(0,100))= 1
      
      [Header(Screen Space Rim)]
      [Toggle(_SCREEN_SPACE_RIM)]_ScreenSpaceRim("Screen Space Rim",Float)= 1
      _ScreenSpaceRimWidth("Screen Space Rim width",Range(0,10))=1 
      _ScreenSpaceRimThreshold("Screen Space Rim Threshold",Range(0,1))= 0.01
      _ScreenSpaceRimFadeout("Screen Space Rim Fadeout", Range(0, 10))= 0.5
      _ScreenSpaceRimBrightness("Screen Space Rim Brightness",Range(0, 10))= 1
      
      [Header(Screen Space Shadow)]
      [Toggle(_SCREEN_SPACE_SHADOW)]_ScreenSpaceShadow("Screen Space shadow", Float)= 1  //Toggle 是开关
      _ScreenSpaceShadowWidth("Screen Space Shadow Width",Range(0,1))= 0.2
      _ScreenSpaceShadowThreshold ("Screen Space Shadow Threshold", Range(0, 1))= 0.015
      _ScreenSpaceShadowFadeout("Screen Space Shadow Fadeout",Range(0, 10))= 0.2
        
      [Header(Diffuse)]
      _ShallowColor("Shallow Color 1",Color)=(0.8,0.8,0.8,1)
      _ShallowColor2("Shallow Color 2",Color)=(0.8,0.8,0.8,1)
      _ShallowColor3("shallow Color 3",Color)=(0.8,0.8,0.8,1)
      _ShallowColor4("Shallow Color 4",Color)=(0.8,0.8,0.8,1) 
      _ShallowColor5("Shallow Color5",Color)=(0.8,0.8,0.8,1)
      
      _ShadowColor("Shadow Color 1",Color)=(0.6,0.6,0.6,1)
      _ShadowColor2("Shadow Color 2",Color)=(0.6,0.6,0.6,1)
      _ShadowColor3("'Shadow Color 3",Color)=(0.6,0.6,0.6,1)
      _ShadowColor4("Shadow Color 4",Color)=(0.6,0.6,0.6,1)
      _ShadowColor5("Shadow Color 5",Color)=(0.6,0.6,0.6,1)
      
      _PostShallowTint("Post Shallow Tint",Color)=(1,1,1,1)
      _PostShallowFadeTint("Post Shallow Fade Tint",Color)=(1,1,1,1)
      _PostShadowTint("Post Shadow Tint",Color)=(1,1,1,1)
      _PostShadowFadeTint("Post Shadow Fade Tint", Color)=(1,1,1,1)
      _PostFrontTint("Post Front Tint",Color)=(1,1,1,1)
      _PostSssTint("Post sss Tint",Color)=(1,1,1,1)
      
      _AlbedoSmoothness("Albedo Smoothness",Range(0,1))= 0.1
        
      [Header(Specular)]
        [Toggle]_Highlightshape("Highlight shape 1",Float)=0
        [Toggle]_Highlightshape2("Highlight Shape 2",Float)=0
        [Toggle]_HighlightShape3("Highlight Shape 3",Float)=0
        [Toggle]_Highlightshape4("Highlight Shape 4",Float)=0
        [Toggle]_Highlightshape5("Highlight Shape 5",Float)=0
        
        _ToonSpecular ("Toon Specular 1",Range(0,1))=0.01
        _ToonSpecular2("Toon Specular 2",Range(0,1))=0.01
        _ToonSpecular3("Toon Specular 3",Range(0,1))= 0.01
        _ToonSpecular4("Toon Specular 4",Range(0,1))=0.01
        _ToonSpecular5("Toon Specular 5",Range(0,1))= 0.01
        
        _SpecularRange ("Specular Range 0",Range(0,2))=1
        _SpecularRange2("Specular Range 1",Range(0,2))=1
        _SpecularRange3("Specular Range 2",Range(0,2))=1
        _SpecularRange4("Specular Range 3",Range(0,2))=1
        _SpecularRange5("Specular Range 4",Range(0,2))=1
        
        _ShapeSoftness ("Shape Softness1", Range(0,1)) =0.1
        _ShapeSoftness2 ("Shape Softness2", Range(0,1)) =0.1
        _ShapeSoftness3 ("Shape Softness3", Range(0,1)) =0.1
        _ShapeSoftness4 ("Shape Softness4", Range(0,1)) =0.1
        _ShapeSoftness5 ("Shape Softness5", Range(0,1)) =0.1
        
        _SpecIntensity("Specular Intensity",Range(0,1))= 0.1
        
        [HDR]_SpecularColor ("specular Color 1",Color)=(1,1,1,1)
        [HDR]_SpecularColor2("specular Color 2",Color)=(1,1,1,1) 
        [HDR]_SpecularColor3("Specular Color 3",Color)=(1,1,1,1)
        [HDR]_SpecularColor4("Specular Color 4",Color)=(1,1,1,1)
        [HDR]_SpecularColor5("Specular Color 5",Color)=(1,1,1,1)
        
        [Header(Rim Glow)]
        [HDR]_RimGlowLightColor ("Light Color 1",color)=(0.55,0.55,0.55,1)
        [HDR]_RimGlowLightColor2("Light color 2",Color)=(0.55,0.55,0.55,1)
        [HDR]_RimGlowLightColor3("Light Color 3",Color)=(0.55,0.55,0.55,1)
        [HDR]_RimGlowLightColor4("Light Color 4",Color)=(0.55,0.55,0.55,1)
        [HDR]_RimGlowLightColor5("Light Color 5",Color)=(0.55,0.55,0.55,1)
        
        [HDR]_UISunColor ("UI Sun Color 1",color)=(1,0.92,0.9,1)
        [HDR]_UISunColor2("UI Sun Color 2",Color)=(1,0.92,0.9,1)
        [HDR]_UISunColor3("UI Sun Color 3",Color)=(1,0.92,0.9,1)
        [HDR]_UISunColor4("UI Sun Color 4",Color)=(1,0.92,0.9,1)
        [HDR]_UISunColor5("UI Sun Color 5",Color)=(1,0.92,0.9,1)
        
        [Header(Outline)]
        [Toggle(_OUTLINE PAss)]_Outline("Outline",Float)= 1
        _OutlineColor("Outline Color 1",Color)=(1,1,1,1)
        _OutlineColor2("Outline Color 2",Color)=(1,1,1,1)
        _OutlineColor3("Outline Color 3",color)=(1,1,1,1)
        _OutlineColor4("Outline Color 4",Color)=(1,1,1,1)
        _OutlineColor5("0utline Color 5",color)=(1,1,1,1)
        _OutlineWidth("0utline Width",Range(0,10))= 1
        _MaxOutlineZOffset("Max 0utline Z 0ffset",Range(0,1))= 0.01

        [Header(MatCap)]
        [Toggle(_MATCAP_ON)]_Matcap("Matcap",Float)=0
        [NoScaleOffset]_MatCapTex("Matcap Tex 1",2D)="white"{ }
        [NoScaleOffset]_MatCapTex2("MatCap Tex 2",2D)="white"{ }
        [NoScaleOffset]_MatCapTex3("MatCap Tex 3",2D)="white"{ }
        [NoScaleOffset]_MatCapTex4("MatCap Tex 4",2D)="white" { }
        [NoScaleOffset]_MatCapTex5("MatCap Tex5",2D)="white"{ }

        _MatCapColorTint("Color Tint 1" ,Color)=(1,1,1,1)
        _MatCapColorTint2("Color Tint 2",Color)=(1,1,1,1)
        _MatCapColorTint3("Color Tint 3",Color)=(1,1,1,1)
        _MatCapColorTint4("Color Tint 4",Color)=(1,1,1,1)
        _MatCapColorTint5("Color Tint 5",Color)=(1,1,1,1)
        
        _MatCapColorBurst("Color Burst 1",Range(0,10))= 1
        _MatCapColorBurst2("Color Burst 2",Range(0,10))= 1
        _MatCapColorBurst3("Color Burst 3",Range(0,10))= 1
        _MatCapColorBurst4("Color Burst 4",Range(0,10))= 1
        _MatCapColorBurst5("Color Burst 5",Range(0,10))= 1
        
        _MatCapAlphaBurst("Alpha Burst 1",Range(0,10))=1
        _MatCapAlphaBurst2("Alpha Burst 2",Range(0,10))=1
        _MatCapAlphaBurst3("Alpha Burst 3",Range(0,10))= 1
        _MatCapAlphaBurst4("Alpha Burst 4",Range(0,10))=1
        _MatCapAlphaBurst5("Alpha Burst 5",Range(0,10))=1
         
        [Toggle]_MatCapRefract("MapCap Refract 1",Float)=0.5
        [Toggle]_MatCapRefract2("MapCap Refract 2",Float)=0.5
        [Toggle]_MatCapRefract3("MapCap Refract 3" ,Float)=0.5
        [Toggle]_MatCapRefract4("MapCap Refract 4",Float)=0.5
        [Toggle]_MatCapRefract5("MapCap Refract 5",Float)=0.5

        
        _RefractDepth("efract Depth 1",Range(0,2))=0.5
        _RefractDepth2("Refract Depth 2",Range(0,2))=0.5
        _RefractDepth3("Refract Depth 3",Range(0,2))= 0.5
        _RefractDepth4("Refract Depth 4",Range(0,2))= 0.5
        _RefractDepth5("Refract Depth 5",Range(0,2))= 0.5
       
        _RefractParam("Refract WrapOffset 1",Vector)=(5,5,0,0)
        _RefractParam2("Refract WrapOffset 2",Vector)=(5,5,0,0)
        _RefractParam3("Refract WrapOffset 3",Vector)=(5,5,0,0)
        _RefractParam4("Refract Wrapoffset 4",Vector)=(5,5,0,0)
        _RefractParam5("Refract WrapOffset 5",Vector)=(5,5,0,0)

        [Enum(AlphaBlended,0,Add,Overlay,2)]_MatCapBlendMode1("MatCap Blend Mode 1",Float) =0
        [Enum(AlphaBlended,0,Add,Overlay,2)]_MatCapBlendMode2("MatCap Blend Mode 2",Float) =0
        [Enum(AlphaBlended,0,Add,Overlay,2)]_MatCapBlendMode3("MatCap Blend Mode 3",Float) =0
        [Enum(AlphaBlended,0,Add,Overlay,2)]_MatCapBlendMode4("MatCap Blend Mode 4",Float) =0
        [Enum(AlphaBlended,0,Add,Overlay,2)]_MatCapBlendMode5("MatCap Blend Mode 5",Float) =0
        
        
        [Header(Option)]
        [Enum(UnityEngine.Rendering.CullMode)]_Cull("Cull(Default back)",Float)= 2
        [Enum(Off,0,0n,1)]_ZWrite("ZWrite(Defalt On)",Float)=1
        [Enum(UnityEngine.Rendering.BlendMode)]_SrcBlendMode("Src blend mode (Default 0ne)",Float)= 1
        [Enum(UnityEngine.Rendering.BlendMode)]_DstBlendMode("Dst blend mode(Default Zero)",Float)=0
        [Enum(UnityEngine.Rendering.Blendop)]_Blendop ("Blend operation (Default Add)", Float)= 0
        _StencilRef("Stencil reference",Int)=0
        [Enum(UnityEngine.Rendering.CompareFunction)]_StencilComp("stencil compare function", Int)= 0
        [Enum(UnityEngine.Rendering.stencilOp)]_StencilPassOp("Stencil pass operation",Int)=0
        [Enum(UnityEngine.Rendering.StencilOp)]_StencilFailOp("stencil fail operation",Int)=0
        [Enum(UnityEngine.Rendering.StencilOp)]_StencilZFailOp("StencilZfail operation",Int)=0
        
        [Header(SRP Default)]
        [Toggle( SRP DEFAULT PASS)]_SRPDefaultPass("SRP Default Pass", Int)= 0
        [Enum(UnityEngine.Rendering.BlendMode)]_SRPSrcBlendMode("SRP src blend mode (Default One)",Float)= 1
        [Enum(UnityEngine.Rendering.BlendMode)]_SRPDstBlendMode("SRP src blend mode (Default Zero)",Float)=0 
        [Enum(UnityEngine.Rendering.BlendOp)]_SRPBlendop("SRP blend operation(Default Add)",Float)= 0
        _SRPStencilRef("SRP stencil reference",Int)= 0
        [Enum(uniryEngine.Rendering.CompareFunction)]_SRPStencilComp("SRP stencil compare function",Int)= 0
        [Enum(UnityEngine.Rendering.StencilOp)]_SRPStencilPassOp("SRP stencil pass operation",Int)=0
        [Enum(UnityEngine.Rendering.stencilOp)]_SRPStencilFailOp("SRP stencil fail operation",Int)= 0
        [Enum(UnityEngine.Rendering.StencilOp)]_SRPStencilZFail0p("SRP stencil Z fail operation",Int)= 0
    }
    
    SubShader
    {
        Tags{
        "RenderPipeline"= "UniversalPipeline"
        "RenderType"="Opaque"
         }
        LOD 100   

        HLSLINCLUDE
        #pragma shader_feature_local_DOMAIN_FACE
        #pragma shader_feature_local_DOMAIN_EYE
        #pragma shader_feature_local_DOMAIN_BODY
        // mulit_compile 是全局的 需要手动声明组合 占用全局额度
        #pragma multi_compile _ _MAIN_LIGHT_SHADOWS         //主光源阴影层级控制（基础/级联/屏幕）6变体	高（深度计算）
        #pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE 
        #pragma multi_compile _ _MAIN_LIGHT_SHADOWS_SCREEN  

        #pragma multi_compile_fragment _ _LIGHT_LAYERS     //光照分层（如角色受单独光源）
        #pragma multi_compile_fragment _ _LIGHT_COOKIES    //光源遮罩（模拟形状光照）
        #pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION  //屏幕空间环境光遮蔽（SSAO）
        #pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS  //额外点光源/聚光灯阴影	
        #pragma multi_compile_fragment _ _SHADOWS_SOFT     //阴影边缘模糊（PCF采样）
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING   //反射探针混合与盒投影（提升金属/光滑表面质感）	
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION

        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl" // Core.hlsl：URP 核心库
        //提供URP的基础数学工具和空间变换函数   TransformworldToHClip()
        // 顶点着色器输入/输出结构体  Attributes、Varyings
        // 纹理采样宏
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"//Lighting.hlsl：光照计算库
        //PBR 光照计算：通过 UniversalFragmentPBR() 实现基于物理的渲染
        //Blinn-Phong 模型​：通过 UniversalFragmentBlinnPhong() 支持传统光照
        //​光源数据获取​： 主光源：GetMainLight()（含阴影、颜色、方向） 附加光源：GetAdditionalLights()（点光源/聚光灯）

        #include"Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"// DeclareDepthTexture.hlsl：深度纹理支持
        //深度纹理变量：TEXTURE2D(_CameraDepthTexture)  采样函数：SampleSceneDepth() 获取非线性深度值  深度值转换：
        //Linear01Depth()：将深度转换为 [0,1] 线性范围
        //LinearEyeDepth()：转换为相机空间的实际距离  //​使用前提​：需在 C# 代码中开启深度纹理：Camera.main.depthTextureMode |= DepthTextureMode.Depth;



        

        CBUFFER_START(UnityPerMaterial)      //常量缓冲区 CBUFFER_START(UnityPerMaterial) 与 CBUFFER_END 之间的变量（如 _Color、_MainTex_ST）是材质专属的 Uniform 
        //支持 SRP Batcher 合批

        float4 _Color;

        sampler2D _MainTex;
        sampler2D _LightTex;
        sampler2D _OtherDataTex;
        sampler2D _OtherDataTex2;
     
        float  _NoseLineHoriDisp;
        float _NoseLineLkDnDisp;
     
        float   _AlphaClip;
      
        float   _BumpScale;
        float   _Glossiness;
        float   _Metallic;
      
        float3 _HeadCenter  ;
        float3 _HeadForward ;
        float3 _HeadRight  ;
        float _HeadSphereRange ;
      
        float  AmbientColorIntensity;
      
        int _SkinMatId;
      
        float  _Modelsize ;
        float  _Modelsize2;
        float   _Modelsize3;
        float  _Modelsize4;
        float    _Modelsize5;
      

        float _ScreenSpaceRim;
        float _ScreenSpaceRimWidth;
        float _ScreenSpaceRimThreshold;
        float  _ScreenSpaceRimFadeout;
        float _ScreenSpaceRimBrightness;
      
      
        float _ScreenSpaceShadow;
        float _ScreenSpaceShadowWidth;
        float _ScreenSpaceShadowThreshold ;
        float _ScreenSpaceShadowFadeout;
        
        float3 _ShallowColor;
        float3 _ShallowColor2;
        float3 _ShallowColor3;
        float3 _ShallowColor4;
        float3 _ShallowColor5;
       
        float3 _ShadowColor;
        float3 _ShadowColor2;
        float3 _ShadowColor3;
        float3 _ShadowColor4;
        float3 _ShadowColor5;

        float3 _PostshallowTint;
        float3 _PostShallowFadeTint;
        float3 _PostShadowTint;
        float3 _PostFrontTint;
        float3 _PostSssTint;
        
        float  _AlbedoSmoothness;

        float  _Highlightshape;
        float  _Highlightshape2;
        float  _HighlightShape3;
        float  _Highlightshape4;
        float  _Highlightshape5;
        
        float  _ToonSpecular ;
        float  _ToonSpecular2;
        float  _ToonSpecular3;
        float  _ToonSpecular4;
        float  _ToonSpecular5;
        
        float  _SpecularRange ;
        float  _SpecularRange2;
        float  _SpecularRange3;
        float  _SpecularRange4;
        float  _SpecularRange5;

        float _ShapeSoftness;
        float _ShapeSoftness2;
        float _ShapeSoftness3;
        float _ShapeSoftness4;
        float _ShapeSoftness5;
        
        float  _SpecIntensity;
        
        float  _SpecularColor ;
        float  _SpecularColor2;
        float  _SpecularColor3;
        float  _SpecularColor4;
        float  _SpecularColor5;
         

        float3 _RimGlowLightColor ;
        float3 _RimGlowLightColor2;
        float3 _RimGlowLightColor3;
        float3 _RimGlowLightColor4;
        float3 _RimGlowLightColor5;
        
        float3 _UIsunColor;
        float3 _UISunColor2;
        float3 _UISunColor3;
        float3 _UISunColor4;
        float3 _UISunColor5;
        
        
        float3 _OutlineColor;
        float3 _OutlineColor2;
        float3 _OutlineColor3;
        float3 _OutlineColor4;
        float3 _OutlineColor5;
        float  _OutlineWidth;
        float  _MaxOutlineZOffset;

        
        
        sampler2D  _MatCapTex;
        sampler2D  _MatCapTex2;
        sampler2D  _MatCapTex3;
        sampler2D  _MatCapTex4;
        sampler2D  _MatCapTex5;

        float3 _MatCapColorTint;
        float3 _MatCapColorTint2;
        float3 _MatCapColorTint3;
        float3 _MatCapColorTint4;
        float3 _MatCapColorTint5;
        
        float  _MatCapColorBurst;
        float  _MatCapColorBurst2;
        float  _MatCapColorBurst3;
        float  _MatCapColorBurst4;
        float  _MatCapColorBurst5;
        
        float  _MatCapAlphaBurst;
        float  _MatCapAlphaBurst2;
        float  _MatCapAlphaBurst3;
        float  _MatCapAlphaBurst4;
        float  _MatCapAlphaBurst5;
         
        float  _MatCapRefract;
        float  _MatCapRefract2;
        float  _MatCapRefract3;
        float  _MatCapRefract4;
        float  _MatCapRefract5;

        float  _RefractDepth;
        float  _RefractDepth2;
        float  _RefractDepth3;
        float  _RefractDepth4;
        float  _RefractDepth5;
       
        float4  _RefractParam;
        float4  _RefractParam2;
        float4  _RefractParam3;
        float4  _RefractParam4;
        float4  _RefractParam5;

        int _MatCapBlendMode1;
        int _MatCapBlendMode2;
        int _MatCapBlendMode3;
        int _MatCapBlendMode4;
        int _MatCapBlendMode5;

        CBUFFER_END

        struct UniversalAttributes
        {
          float4 positionOS : POSITION;
          float3 normalOS : NORMAL;
          float4 tangentOS : TANGENT;
          float2 texcoord : TEXCOORD0;
        };

        struct UniversalVaryings
        {
            float2 uv        : TEXCOORD0;
            float4 positionWSAndFogFactor : TEXCOORD1; // xyz: positionWS, w: fogFactor
            float3 normalWS : TEXCOORD2;
            float4 tangentWS : TEXCOORD3;
            float3 viewDirectWS : TEXCOORD4;
            float4 positionCS : SV_POSITION;
        };

        UniversalVaryings MainVS(UniversalAttributes input)
        {
            VertexPositionInputs positionInputs = GetVertexPositionInputs(input.positionOS.xyz);
            VertexNormalInputs normalInputs = GetVertexNormalInputs(input.normalOS, input.tangentOS);
            //包含 normalWS tangentWS bitangentWS

            UniversalVaryings output;
            output.positionCS = positionInputs.positionCS;
            output.positionWSAndFogFactor = float4(positionInputs.positionWS, ComputeFogFactor(positionInputs.positionCS.z));  //雾效因子计算
            //根据裁剪空间深度（Z值）计算雾效强度（0~1），线性雾或指数雾由 URP 全局设置决定
            output.normalWS = normalInputs.normalWS;
            output.tangentWS.xyz = normalInputs.tangentWS;
            output.tangentWS.w = input.tangentOS.w * GetOddNegativeScale();
            //同时兼容模型自身的切线方向​（tangentOS.w）和当前缩放导致的坐标系翻转​（GetOddNegativeScale()）
            output.viewDirectWS = GetWorldSpaceViewDir(positionInputs.positionWS);
            //output.viewDirectWS = unity_OrthoParams.w == 0 ? GetOddNegativeScale() - positionInputs.positionWS :  GetWorldToViewMatrix()[2].xyz;
            output.uv = input.texcoord;
            return output;
        }

        float4 MainPS(UniversalVaryings input,bool isFrontFace : SV_IsFrontFace ) : SV_Target  //判断三角形朝向
        {
            float4 mainTex  = tex2D(_MainTex,input.uv);
            mainTex *= _Color;
            float3 baseCol = mainTex.rgb;
            float baseAlpha = 1.0;
            #if _DOMAIN_BODY || _DOMAIN_EYE
            {
                baseAlpha = mainTex.a;
            }
            #endif
            
            return float4 (baseCol,baseAlpha);
        }
        
        ENDHLSL

        Pass
        {
           Name"ShadowCaster"
           Tags
            {
                "LightMode" = "ShadowCaster"
            }

            ZWrite [_ZWrite]  //决定当前物体的像素深度值是否写入深度缓冲区（Z-Buffer）
            ZTest LEqual     //LEqual（默认值）：当像素深度值 ≤ 深度缓冲区值时通过测试（即近处物体遮挡远处物体）
            ColorMask 0      //阻止当前物体的任何颜色（RGBA通道）输出到颜色缓冲区 跳过片元着色器的颜色计算与写入，减少GPU带宽占用 阴影生成Pass中仅需深度信息 ​深度预处理Pass
            Cull [_Cull]     //决定剔除模型的正面或背面，或不剔除 Back（默认）：剔除背面（内表面），优化性能 Off：双面渲染（如透明玻璃、树叶） Front：剔除正面（用于特殊效果，如内部高亮）
           
            HLSLPROGRAM
            #pragma multi_compile_instancing        //启用GPU Instancing支持    INSTANCING_ON：启用实例化，支持批量渲染相同网格与材质的物体。
            #pragma multi_compile _DOTS_INSTANCING_ON   //支持DOTS（Data-Oriented Tech Stack）的实例化方案 _DOTS_INSTANCING_ON：启用DOTS实例化，适配ECS架构的高效数据管理

            #pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOWS

            #pragma vertex vert
            #pragma fragment frag

            float3 _LightDirection;
            float3 _LightPosition;

            struct Attributes
            {
                float4 positionOS   : POSITION;
                float3 normalOS     : NORMAL;
                float2 texcoord     : TEXCOORD0;
            };

            struct  Varyings 
            {
               float2 uv     : TEXCOORD0;
               float4 positionCS : SV_POSITION;
            };

            float4  GetShadowPositionHClip(Attributes input)
            {
               float3 positionWS = TransformObjectToWorld(input.positionOS.xyz);
               float3 normalWS = TransformObjectToWorldNormal(input.normalOS); 

            #if _CASTING_PUNCTUAL_LIGHT_SHADOW   //由指令 #pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOWS 生成的编译开关
                float3 lightDirectionWS = normalize(_LightPosition - positionWS) ;
            #else
                float3 LightDirectionWS = _LightDirection;
            #endif

                float4 positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS,normalWS,LightDirectionWS)); // ​**ApplyShadowBias：阴影偏移抗失真

            #if   UNITY_REVERSED_Z
                positionCS.z = min(positionCS.z, UNITY_NEAR_CLIP_VALUE);      //反转Z平台：限制深度不超过近裁剪值
            #else    
                positionCS.z = max(positionCS.z,UNITY_NEAR_CLIP_VALUE);     //传统Z平台：限制深度不低于近裁剪值
            #endif

                return positionCS;
            }

            Varyings vert(Attributes input)
            {
                Varyings output;
                output.uv =input.texcoord;
                output.positionCS = GetShadowPositionHClip(input);
                return output;
            }

            float4 frag(Varyings input) : SV_TARGET
            {
                 clip(1.0 - _AlphaClip);
                return 0;
            }

            ENDHLSL

        }

        Pass
        {
            Name "DepthOnly"
            Tags
            {
                "LightMode" = "DepthOnly"
            }
            
            ZWrite [_ZWrite]
            ColorMask 0
            Cull [_Cull]
            
            HLSLPROGRAM

            #pragma  multi_compile_instancing
            #pragma  multi_compile _ DOTS_INSTANCING_ON

            #pragma  vertex vert
            #pragma  fragment frag

            struct Attributes
            {
                float4 positionOS  : POSITION;
            };

            struct Varyings
            {
                float4 positionCS   : SV_POSITION;
            };

            Varyings vert(Attributes input)
            {
                Varyings output = (Varyings)0;
                output.positionCS = TransformObjectToHClip(input.positionOS.xyz);

                return  output;
            }

            half4 frag(Varyings input) : SV_TARGET
            {
                clip(1.0 - _AlphaClip);
                return 0;
            }
            ENDHLSL
        }
        
        Pass
        {
            Name "DepthNormals"   //SSAO的深度和法线
            Tags 
            {
                "LightMode" = "DepthNormals"
            }
            
            ZWrite [_ZWrite]
            Cull [_Cull]
            
            HLSLPROGRAM

            #pragma  multi_compile_instancing
            #pragma  multi_compile _ DOTS_INSTANCING_ON

            #pragma  vertex vert
            #pragma  fragment frag

            struct Attributes
            {
                float4 positionOS  : POSITION;
                float4 tangentOS   : TANGENT;
                float2 texcoord    : TEXCOORD0;
                float3 normalOS    : NORMAL  ;
            };

            struct Varyings
            {
                float4 positionCS   : SV_POSITION;
                float2 uv : TEXCOORD0;
                float3 normalWS   :  TEXCOORD1;
                float4 tangentWS  :  TEXCOORD2;
            };

            Varyings vert(Attributes input)
            {
                Varyings output= (Varyings)0;

                output.uv         = input.texcoord;
                output.positionCS = TransformObjectToHClip(input.positionOS.xyz);

                VertexPositionInputs vertexInput = GetVertexPositionInputs(input.positionOS.xyz);
                VertexNormalInputs normalinputs = GetVertexNormalInputs(input.normalOS,input.tangentOS);

                half3 viewDirWS  = GetWorldSpaceNormalizeViewDir(vertexInput.positionWS);
                output.normalWS  = half3(normalinputs.normalWS);
                float sign = input.tangentOS.w * float(GetOddNegativeScale());
                output.tangentWS = half4(normalinputs.tangentWS.xyz,sign);

                return  output;
            }
            
            half4 frag(Varyings input) : SV_TARGET
            {
                clip(1.0 - _AlphaClip);
                float3 normalWS = input.normalWS.xyz;
                return half4(NormalizeNormalPerPixel(normalWS),0.0);
            }
            ENDHLSL
        }

                Pass
        {
            Name "UniversalForward"
            Tags
            {
                "LightMode" = "UniversalForward"
            }
            Cull [_Cull]
            Blend [_SrcBlendMode] [_DstBlendMode]
            BlendOp [_BlendOp]
            ZWrite [_ZWrite]
            Stencil
            {
                Ref [_StencilRef]
                Comp [_StencilComp]
                Pass [_StencilPassOp]
                Fail [_StencilZFailOp]
                ZFail [_StencilFailOp]//ZFail [_StencilZFailOp]
            }
            
            HLSLPROGRAM

            #pragma  shader_feature_local _SCREEN_SPACE_RIM
            #pragma  shader_feature_local _SCREEN_SPACE_SHADOW
            #pragma  shader_feature_local _MATCAP_ON

            #pragma  vertex MainVS
            #pragma  fragment MainPS

            #pragma multi_compile_fog

            ENDHLSL
        }
    }   

}