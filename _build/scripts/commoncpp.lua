dofile "common.lua"

-- cpp
-- //--------------------------------------------------------------------------

function cpp_common()
    includedirs(
    { 
        SRC_DIR,
    })
end

-- //--------------------------------------------------------------------------

function cpp_solution(solutionName)
  local geneeratepath = SLN_DIR
  print_info("processing solution " .. solutionName .. " at " .. geneeratepath)
  solution(solutionName)
    configurations { "debug", "release" }
    location(geneeratepath)
    language("c++")
    
    platforms({ "x64" })
  
  configuration("debug")
    symbols("On")
    defines 
    {
        "DEBUG",
        "WINDOWS",
        "WIN32_LEAN_AND_MEAN"
    }

  configuration("release")
    optimize("On")
    defines
    {
        "NDEBUG", 
        "WINDOWS",
        "WIN32_LEAN_AND_MEAN"
    }
  
end

-- //--------------------------------------------------------------------------

function cpp_lib(moduleName, projectName)
    project_common(moduleName, projectName)
    objdir(BUILD_DIR .. "/_obj")
    files({
        "**.cpp",
        "**.hpp",
        "**.h",
        "**.ini"
    })

    cpp_common()
    kind("StaticLib")
end

function cpp_dyn_lib(moduleName, projectName)
    project_common(moduleName, projectName)
    objdir(BUILD_DIR .. "/_obj")
    files({
        "**.cpp",
        "**.hpp",
        "**.h",
        "**.ini"
    })
    cpp_common()
    kind("SharedLib")

    defines { "BUILD_" .. string.upper(moduleName) .. "_" .. string.upper(projectName)}
end

-- //--------------------------------------------------------------------------

function cpp_app(moduleName, projectName)
    project_common(moduleName, projectName)
    objdir(BUILD_DIR .. "/_obj")
    files({
        "**.cpp",
        "**.hpp",
        "**.h",
        "**.ini"
    })
    cpp_common()
    kind("ConsoleApp")
end

-- //--------------------------------------------------------------------------