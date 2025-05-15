project "ImGui"
	kind "StaticLib"
	language "C++"
	staticruntime "On"

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

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

	filter { "system:windows", "configurations:Release or configurations:Dist" }
		runtime "Release"
		optimize "On"
	filter { "system:windows", "configurations:Debug" }
		runtime "Debug"
		symbols "On"
