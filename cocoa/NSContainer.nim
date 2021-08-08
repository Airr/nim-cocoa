{.compile: "widgets/container.m".}

import NSFunctions

proc newContainer*(parent: ID, title: cstring; left: cint; top: cint; width: cint; height: cint): ID  {.cdecl, importc: "createBox".}