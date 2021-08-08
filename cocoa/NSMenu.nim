{.compile: "widgets/menu.m".}

import NSFunctions

proc newMenu*(title: cstring): ID {.cdecl, importc: "createMenu".}
proc newMenuItem*(parent: ID, caption, key: cstring, `callback`:ACTION) {.cdecl, importc: "createMenuItem".}
proc newMenuSeparator*(parent: ID) {.cdecl, importc: "createMenuSeparator".}
proc setSystemAction*(widget: ID, title, actionName: cstring) {.cdecl, importc: "setSystemAction".}
proc newFileMenu*() {.cdecl, importc: "createFileMenu".}
proc newEditMenu*() {.cdecl, importc: "createEditMenu".}
proc newFormatMenu*() {.cdecl, importc: "createFormatMenu".}