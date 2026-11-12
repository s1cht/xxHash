local localBinLocation = "%{wks.location}/bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}"
local localBinIntLocation = "%{wks.location}/bin-int/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}"

if (outputBinDirectory ~= nil) then localBinLocation = outputBinDirectory .. "/%{prj.name}" end
if (outputInterDirectory ~= nil) then localBinIntLocation = outputInterDirectory .. "/%{prj.name}" end

project "xxHash"
	kind "StaticLib"
	language "C"
    staticruntime "off"

	targetdir (localBinLocation)
	objdir    (localBinIntLocation)

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
