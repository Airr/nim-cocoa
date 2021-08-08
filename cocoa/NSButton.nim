{.compile: "widgets/button.m".}

import NSFunctions

proc newButton*(parent: ID; caption: cstring; left: cint; top: cint; width: cint; height: cint; `func`: ACTION): ID  {.cdecl, importc: "createButton".}
## Creates new Button object
##
## Example:
## 
## .. code-block::nim
##    btn1 = newButton(mainWindow, "Open", width-100, 20, 90, 24, btnClicked)
## 
## 
## Callback must be in the form:
##
## .. code-block::nim
##    proc buttonCB(sender: ID) {.cdecl.} =
##      <..code...>
##

