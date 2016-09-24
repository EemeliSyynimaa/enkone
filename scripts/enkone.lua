project "enkone"
    targetname "enkone"
    kind "StaticLib"
    flags
    {
        "ExtraWarnings",
        "FatalWarnings"
    }

    files
    {
        path.join(EN_DIR, "include", "**.h"),
        path.join(EN_DIR, "src", "**.c")
    }
    
    includedirs
    {
        path.join(EN_DIR, "include")
    }