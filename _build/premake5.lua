--Builds vs2015
BUILD_DIR = path.getabsolute(os.getcwd())
PROJECT_ROOT_DIR = path.getabsolute(BUILD_DIR .. "/..")
SRC_DIR = path.getabsolute(PROJECT_ROOT_DIR .. "/code/src")

SLN_DIR = BUILD_DIR .. "/_solutions"
OBJ_DIR = BUILD_DIR .. "/_obj"
OUT_DIR = BUILD_DIR .. "/_out"
TARGET_DIR = OUT_DIR .. "/_bin/$(Configuration)/$(Platform)"

dofile("./scripts/common.lua")

print("--------------------------------------------------------------")
print_info("Generating..")
print_info("build dir: " ..  BUILD_DIR)
print_info("src dir: " ..  SRC_DIR)

print("--------------------------------------------------------------")

print_info("sln dir: " ..  SLN_DIR)
print_info("obj dir: " ..  OBJ_DIR)
print_info("out dir: " ..  OUT_DIR)
print_info("target dir: " ..  TARGET_DIR)

print("--------------------------------------------------------------")

dofile("./scripts/commoncs.lua")
dofile("./scripts/commoncpp.lua")
dofile("./scripts/configure.lua")

ROOT = SRC_DIR .. "/premake.lua"
print_info(ROOT)

dofile(ROOT)