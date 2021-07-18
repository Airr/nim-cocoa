{.compile: "widgets/menu.m".}

import NSFunctions

proc newMenu*(title: cstring): ID {.cdecl, importc: "createMenu".}
proc newMenuItem*(parent: ID, caption, key: cstring, `callback`:ACTION) {.cdecl, importc: "createMenuItem".}
proc newMenuSeparator*(parent: ID) {.cdecl, importc: "createMenuSeparator".}