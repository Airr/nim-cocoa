{.compile: "widgets/window.m".}
{.compile: "widgets/saneview.m".}

import NSFunctions

{.passL: "-fobjc-arc -framework Cocoa"}

proc newWindow*(title: cstring, width, height: int): ID {.importc: "createWindow".}
