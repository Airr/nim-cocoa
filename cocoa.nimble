# Package

version       = "0.1.0"
author        = "Armando Rivera"
description   = "macOS Cocoa GUI package"
license       = "MIT"
srcDir        = "src"
bin           = @["bundle"]
installDirs = @["cocoa"]


# Dependencies

requires "nim >= 1.4.8, plists"
