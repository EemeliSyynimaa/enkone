function build_config(build_dir)
    if _ACTION == nil then return false end
    
    location(path.join(build_dir, "projects", _ACTION))
        
    if _ACTION == "clean" then
        os.rmdir(build_dir)
    end
        
    flags 
    {
        "ExtraWarnings",
        "FatalWarnings"
    }
    
    configuration { "vs*", "x32" }
        targetdir       (path.join(build_dir, "win32_" .. _ACTION, "bin"))
        objdir          (path.join(build_dir, "win32_" .. _ACTION, "obj"))
        
    configuration { "vs*", "x64" }
        defines         { "_WIN64" }
        targetdir       (path.join(build_dir, "win64_" .. _ACTION, "bin"))
        objdir          (path.join(build_dir, "win64_" .. _ACTION, "obj"))

    configuration { "linux-gcc*", "x32" }
        buildoptions    { "-m32" }
        targetdir       (path.join(build_dir, "linux32_gcc/bin"))
        objdir          (path.join(build_dir, "linux32_gcc/obj"))
       
    configuration { "linux-gcc*", "x64" }
        buildoptions    { "-m64" }
        targetdir       (path.join(build_dir, "linux64_gcc/bin"))
        objdir          (path.join(build_dir, "linux64_gcc/obj"))
        
    configuration { "linux-clang", "x32" }
        buildoptions    { "-m32" }
        targetdir       (path.join(build_dir, "linux32_clang/bin"))
        objdir          (path.join(build_dir, "linux32_clang/obj"))
        
    configuration { "linux-clang", "x64" }
        buildoptions    { "-m64" }
        targetdir       (path.join(build_dir, "linux64_clang/bin"))
        objdir          (path.join(build_dir, "linux64_clang/obj"))
        
    configuration {}
    
    return true
end