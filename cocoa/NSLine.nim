{.compile: "widgets/line.m".}

import NSFunctions

proc newLine*(parent: ID, left, top, width: cint): ID {.cdecl, importc: "createLine".}