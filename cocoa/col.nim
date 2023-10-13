{.pragma: libcol_s, cdecl.}
{.passL: "-fobjc-arc -framework Cocoa -lcol_s"}


type
  id* = pointer
  ACTION* = proc (a1: id) {.cdecl.}


const
  akNone* = 0
  akRight* = 1
  akWidth* = 2
  akLeft* = 4
  akBottom* = 8
  akHeight* = 16
  akFull* = 18
  akTop* = 32


proc newWindow*(title: cstring; width: cint; height: cint): id {.cdecl, importc: "createWindow".}

proc Pin(widget: id; value: cint) {.cdecl, importc: "Pin".}

proc Cocoa_Init*() {.cdecl, importc: "Cocoa_Init".}

proc Cocoa_Run*(a2: id) {.cdecl, importc: "Cocoa_Run".}

proc Cocoa_Quit*(a2: id) {.cdecl, importc: "Cocoa_Quit".}

proc Cocoa_About*() {.cdecl, importc: "Cocoa_About".}

proc SetText(widget: id; txt: cstring) {.cdecl, importc: "SetText".}

proc GetText(widget: id): cstring {.cdecl, importc: "GetText".}

proc GetValue(widget: id): cint {.cdecl, importc: "GetValue".}

proc SetValue(widget: id; value: cint) {.cdecl, importc: "SetValue".}

proc AddItem(widget: id; txt: cstring) {.cdecl, importc: "AddItem".}

proc newTextField*(parent: id; txt: cstring; l: cint; t: cint; w: cint; h: cint): id {.cdecl, importc: "createTextField".}

proc newComboBox*(parent: id; l: cint; t: cint; w: cint; h: cint; callback: ACTION): id {.cdecl, importc: "createComboBox".}

proc newButton*(parent: id; caption: cstring; l: cint; t: cint; w: cint; h: cint; `func`: ACTION): id {.cdecl, importc: "createButton".}

proc SetAction(widget: id; `func`: ACTION) {.cdecl, importc: "SetAction".}
proc newCheckBox*(parent: id; caption: cstring; l: cint; t: cint; w: cint; h: cint): id {.cdecl, importc: "createCheckBox".}

proc SetState(widget: id; state: bool) {.cdecl, importc: "SetState".}

proc State(widget: id): cint {.cdecl, importc: "State".}

proc newListBox*(parent: id; l: cint; t: cint; w: cint; h: cint): id {.cdecl, importc: "createListBox".}

proc Clearitems*(widget: id) {.cdecl, importc: "LB_Clear".}
proc SetItem*(widget: id; pos: cint) {.cdecl, importc: "SetItem".}
proc RemoveItem*(widget: id; pos: cint) {.cdecl, importc: "RemoveItem".}
proc newOpenDialog*(parent: id; types: cstring): cstring {.cdecl, importc: "createOpenDialog".}

proc newSaveDialog*(parent: id; title: cstring; types: cstring): cstring {.cdecl, importc: "createSaveDialog".}

proc newDialog*(title: cstring; message: cstring; `type`: cint): cint {.cdecl, importc: "createDialog".}
proc newMessageBox*(title: cstring; message: cstring; `type`: cint): cint {.cdecl, importc: "createMessageBox".}

proc newColorDialog*(): id {.cdecl, importc: "createColorDialog".}
proc getColor*(panel: id): cstring {.cdecl, importc: "getColor".}
proc hexColor*(cPanel: id): cstring {.cdecl, importc: "hexColor".}
proc newLabel*(parent: id; txt: cstring; l: cint; t: cint; w: cint; h: cint): id {.cdecl, importc: "createLabel".}

proc newTextEdit*(parent: id; txt: cstring; l: cint; t: cint; w: cint; h: cint): id {.cdecl, importc: "createTextEdit".}

proc Notify*(title: cstring; subtitle: cstring; text: cstring) {.cdecl, importc: "Notify".}

proc newSeparator*(parent: id; x: cint; y: cint; width: cint): id {.cdecl, importc: "createLine".}
proc newMenu*(Title: cstring): id {.cdecl, importc: "createMenu".}
proc newMenuItem*(parent: id; caption: cstring; key: cstring; callback: ACTION) {.cdecl, importc: "createMenuItem".}
proc newMenuSeparator*(parent: id) {.cdecl, importc: "createMenuSeparator".}
proc newSlider*(parent: id; left: cint; top: cint; width: cint; height: cint; callback: ACTION): id {.cdecl, importc: "createSlider".}
proc setDelegate*(widget: ID) {.cdecl, importc: "setDelegate".}

proc `text=`*(widget: id; txt: cstring) =
  widget.SetText(txt)

proc `reset`*(widget: id) =
  widget.SetText("")

proc `text`*(widget: id): string =
  $GetText(widget)

# proc `item`*(widget: id): cstring =
#   GetItem(widget)
  
proc `anchor=`*(widget: id; value: cint) =
  widget.Pin(value)

proc `state`*(widget: id): cint =
  widget.State()

proc `state=`*(widget: id; val: bool) =
    widget.SetState(val)

proc `item=`*(widget: id, val: cstring) =
    widget.AddItem(val)

proc `item`*(widget: id): string =
    $GetText(widget)

proc action*(widget: id, action:ACTION) =
  SetAction(widget, action)

proc value*(widget: id, value: cint) =
  SetValue(widget, value)

proc value*(widget: id): cint =
  GetValue(widget)

# #endif
