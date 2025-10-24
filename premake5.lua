project "ImGui"
    kind "StaticLib"
	language "C++"
    cppdialect "C++17"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp",
		"imgui_tables.cpp"
	}

	filter "not *DLL"
		staticruntime "On"
	filter "*DLL"
        -- Export Imgui symbols for DLL builds
		defines "IMGUI_API=__declspec(dllexport)"
        -- Don't include Static runtime
		staticruntime "Off"
	filter "system:windows"
		systemversion "latest"

	filter {"configurations:Release* or configurations:Dist*" }
		runtime "Release"
		optimize "On"
	filter {"configurations:Debug*" }
		runtime "Debug"
		symbols "On"
