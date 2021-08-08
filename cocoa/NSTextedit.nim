{.compile: "widgets/textedit.m".}

import NSFunctions

proc newTextEdit*(parent: ID; txt: cstring, left, top, width, height: int): ID {.cdecl, importc: "createTextEdit".}