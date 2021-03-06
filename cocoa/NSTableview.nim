{.compile: "widgets/tableview.m".}

import NSFunctions

proc newTableview*(parent: ID, left, top, width, height: cint): ID {.cdecl, importc: "createTableView".}
proc addColumn*(parent: ID, name: cstring) {.cdecl, importc: "newTableColumn".}
proc addRow*(parent: ID, person: cstring) {.cdecl, importc: "addRow".}
proc saveTableView*(tview: ID, path: cstring) {.cdecl, importc: "tableviewSaveToFile".}
proc loadTableView*(tview: ID, path: cstring) {.cdecl, importc: "tableviewLoadFromFile".}