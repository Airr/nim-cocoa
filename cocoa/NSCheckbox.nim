{.compile: "widgets/checkbox.m".}

import NSFunctions

proc newCheckBox*(parent: ID, caption: cstring, left, top, width, height:int): ID {.cdecl, importc: "createCheckBox".}