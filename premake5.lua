project "xxHash"
	kind "StaticLib"
	language "C"
    staticruntime "off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
        "xxhash.h",
        "xxhash.c",
        "xxh3.h",
        "xxh_x86dispatch.h",
        "xxh_x86dispatch.c",
        "xxh_x86dispatch.c"
    }

    defines
    {
        "XXH_EXPORT",
    }

    includedirs
    {
        "./",
    }

	filter "system:windows"
		systemversion "latest"
		cdialect "C17"

	filter "system:linux"
		systemversion "latest"
		cdialect "gnu17"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
