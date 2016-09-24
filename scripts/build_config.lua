function build_config(build_dir)

    newoption 
    {
        trigger = "gcc",
        value   = "GCC",
        description = "Choose GCC flavor",
        allowed = 
        {
            { "linux-gcc", "Linux GCC compiler" },
            { "linux-clang", "Linux Clang compiler" }
        }
    }

    if _ACTION == nil then return false end
    
    location(path.join(build_dir, "projects", _ACTION))
        
    if _ACTION == "clean" then
        os.rmdir(build_dir)
    end
    
    if _ACTION == "gmake" then
        if nil == _OPTIONS["gcc"] then
            print("Choose a GCC flavor!")
            os.exit(1)
        end	

        if "linux-gcc" == _OPTIONS["gcc"] then
            location(path.join(build_dir, "projects", _ACTION .. "-linux"))
        elseif "linux-clang" == _OPTIONS["gcc"] then
            premake.gcc.cc  = "clang"
            premake.gcc.cxx = "clang++"
            premake.gcc.ar  = "ar"
            location(path.join(build_dir, "projects", _ACTION .. "-linux-clang"))
        end
    end
        
    flags 
    {
        "ExtraWarnings",
        "FatalWarnings"
    }
    
    configuration "Debug"
        targetsuffix "-d"
    
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