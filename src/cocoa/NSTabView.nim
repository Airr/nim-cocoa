{.compile: "widgets/tabview.m".}

import NSFunctions

proc newTabBox*(parent: ID, label: cstring; left: cint; top: cint; width: cint; height: cint): ID  {.cdecl, importc: "createTabView".}

proc addTab*(parent: ID, label: cstring) {.cdecl, importc: "addTab".}