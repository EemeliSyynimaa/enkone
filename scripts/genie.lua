EN_DIR = path.getabsolute("..")
EN_BUILD_DIR = path.join(EN_DIR, ".build")

dofile("build_config.lua")
dofile("example.lua")

solution "enkone"
    configurations
    {
        "release",
        "debug"
    }
    
    platforms
    {
        "x32",
        "x64"
    }
    
    language "C"
    startproject "helloworld"
    
    configuration {}
    
build_config(EN_BUILD_DIR)

dofile("enkone.lua")

create_example("helloworld")