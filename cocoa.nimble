# Package

version       = "0.1.1"
author        = "Armando Rivera"
description   = "macOS Cocoa GUI package"
license       = "MIT"
# srcDir        = "src"
bin           = @["bundle", "cocoa"]
installDirs   = @["cocoa"]
installFiles  = @["cocoa.nim"]


# Dependencies

requires "nim >= 1.4.8, plists"
