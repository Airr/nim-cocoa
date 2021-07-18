{.compile: "widgets/label.m".}

import NSFunctions

proc newLabel*(parent: ID; txt: cstring, left, top, width, height: int): ID {.cdecl, importc: "createLabel".}