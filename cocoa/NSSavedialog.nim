{.compile: "widgets/savedialog.m".}

import NSFunctions

proc newSaveDialog*(parent: ID, title: cstring, types: cstring): cstring {.cdecl, importc: "createSaveDialog".}