{.compile: "widgets/dialog.m".}

# import NSFunctions

proc newDialog*(title, message: cstring, height: cint): cint {.cdecl, importc: "createDialog".}