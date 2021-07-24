{.compile: "widgets/textfield.m".}

import NSFunctions

proc newTextField*(parent: ID; txt: cstring; left: cint; top: cint; width: cint; height: cint): ID  {.cdecl, importc: "createTextField".}