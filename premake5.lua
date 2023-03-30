workspace "Hazel"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Hazel"
    location "Hazel"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/${prj.name}")
    objdir ("bin-int/" .. outputdir .. "/${prj.name}")

    files
    {
        "${prj.name}/src/**.h",
        "${prj.name}/src/**.cpp"
    }

    include
    {
        "${prj.name}/vendor/spdlog/include"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

    HZ_PLATFORM_WINDOWS;HZ_BUILD_DLL;_WINDLL;
