{.compile: "widgets/combobox.m".}

import NSFunctions

proc newComboBox*(parent: ID; left: cint; top: cint; width: cint; height: cint; `callback`: ACTION): ID {.cdecl, importc: "createComboBox".}