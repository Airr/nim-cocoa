{.compile: "widgets/savedialog.m".}

import NSFunctions

proc newSaveDialog*(parent: ID, types: cstring): cstring {.cdecl, importc: "createSaveDialog".}