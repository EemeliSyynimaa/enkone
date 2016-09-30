function create_example(name)
    project(name)
        targetname(name)
        kind "ConsoleApp"
        
        includedirs
        {
            path.join(EN_DIR, "include")
        }
        
        files
        {
            path.join(EN_DIR, "examples", name, "**.h"),
            path.join(EN_DIR, "examples", name, "**.c") 
        }
        
        links
        {
            "enkone"
        } 
end