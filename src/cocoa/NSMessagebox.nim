{.compile: "widgets/messagebox.m".}

# import NSFunctions

proc newMessageBox*(title, message: cstring, height: cint): cint {.cdecl, importc: "createMessageBox".}
