{.compile: "widgets/radiobutton.m".}

import NSFunctions

proc newRadioButton*(parent: ID, caption: cstring; left: cint; top: cint; width: cint; height: cint; callback: ACTION): ID  {.cdecl, importc: "createRadioButton".}