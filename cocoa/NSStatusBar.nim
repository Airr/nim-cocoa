{.compile: "widgets/statusbar.m".}

import NSFunctions

proc newStatusBar*(resource: cstring): ID {.cdecl, importc: "createStatusBar".}
proc newStatusMenu*(): ID {.cdecl, importc: "createStatusMenu".}
proc newStatusMenuItem*(parent: ID, tag: int, title: cstring, callback: ACTION) {.cdecl, importc: "createStatusItem".}
proc separator*(parent: ID) {.cdecl, importc: "addSeparator".}

proc setStatusMenu*(parent, menu: ID) {.cdecl,importc: "setMenu".}
proc tag*(widget: ID): int {.cdecl, importc: "tag".}
proc Status_Init*() {.cdecl, importc: "Status_Init".}

proc `menu=`*(parent,widget: ID ) =
  parent.setStatusMenu(widget)