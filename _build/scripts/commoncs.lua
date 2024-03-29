
dofile "common.lua"

-- cs
-- //--------------------------------------------------------------------------

function cs_solution(solutionName)
  local generatepath = SLN_DIR
  print_info("processing solution " .. solutionName .. " at " .. generatepath)
  solution(solutionName)
    configurations { "debug", "release" }
    location(generatepath)
    language("c#")
    
    platforms({ "x64" })
  
  configuration("debug")
    symbols("On")
    defines 
    {
        "DEBUG", 
    }

  configuration("release")
    optimize("On")
    defines
    {
        "NDEBUG", 
    }
end

-- //--------------------------------------------------------------------------

function cs_windowedapp(moduleName, projectName)
    project_common(moduleName, projectName)
    files { "**.cs", "**.tt", "**.config", "**.xaml" }
    excludes { "obj/**" }
    kind("WindowedApp")    

    if(_ACTION == "clean") then
        os.rmdir(path.getabsolute(os.getcwd()) .. "/obj")
    end
end


-- //--------------------------------------------------------------------------

function cs_lib(moduleName, projectName)
    project_common(moduleName, projectName)
    files { "**.cs", "**.tt", "**.config", "**.xaml" }
    excludes { "obj/**" }
    kind("SharedLib")    

    if(_ACTION == "clean") then
        os.rmdir(path.getabsolute(os.getcwd()) .. "/obj")
    end
end

-- //--------------------------------------------------------------------------

function cs_app(moduleName, projectName)
    project_common(moduleName, projectName)    
    files { "**.cs", "**.tt", "**.config", "**.xaml" }
    excludes { "obj/**" }
    kind("ConsoleApp")

    if(_ACTION == "clean") then
        os.rmdir(path.getabsolute(os.getcwd()) .. "/obj")    
    end
end

-- //--------------------------------------------------------------------------