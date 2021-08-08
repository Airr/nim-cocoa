import ospaths

# Package

version       = "0.1.1"
author        = "Armando Rivera"
description   = "macOS Cocoa GUI package"
license       = "MIT"
bin           = @["bundle"]
skipDirs      = @["cocoa"]
installFiles  = @["cocoa.nim"]


# Dependencies

requires "nim >= 1.4.8, plists"

before install:
    
    const libDir = getHomeDir() & "/.nimble/lib"
    mkDir(libdir)
    exec " nim c --app:staticlib -d:release -o:" & libdir & "/libcocoa.a cocoa_lib.nim"