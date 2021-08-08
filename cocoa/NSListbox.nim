{.compile: "widgets/listbox.m".}

import NSFunctions

proc newListBox*(parent: ID, left, top, width, height: cint): ID {.cdecl, importc: "createListBox".}