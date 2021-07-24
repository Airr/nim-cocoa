{.compile: "widgets/button.m".}

import NSFunctions

proc newButton*(parent: ID; caption: cstring; left: cint; top: cint; width: cint; height: cint; `func`: ACTION): ID  {.cdecl, importc: "createButton".}