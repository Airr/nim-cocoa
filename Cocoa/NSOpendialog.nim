{.compile: "widgets/opendialog.m".}

import NSFunctions

proc newOpenDialog*(parent: ID, types: cstring): cstring {.cdecl, importc: "createOpenDialog".}