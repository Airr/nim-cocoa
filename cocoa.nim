{.passL: "-fobjc-arc -framework Cocoa -L$HOME/.nimble/lib -lcocoa"}

type
    ID* = pointer
    ACTION* = proc (a2: ID) {.cdecl.}


# WINDOW STYLES
const
    NSWindowStyleMaskBorderless*             = 0
    NSWindowStyleMaskTitled*                 = 1 shl 0
    NSWindowStyleMaskClosable*               = 1 shl 1
    NSWindowStyleMaskMiniaturizable*         = 1 shl 2
    NSWindowStyleMaskResizable*              = 1 shl 3
    NSWindowStyleMaskUtilityWindow*          = 1 shl 4
    NSWindowStyleMaskDocModalWindow*         = 1 shl 6
    NSWindowStyleMaskNonactivatingPanel*     = 1 shl 7
    NSWindowStyleMaskUnifiedTitleAndToolbar* = 1 shl 12
    NSWindowStyleMaskHUDWindow*              = 1 shl 13
    NSWindowStyleMaskFullScreen*             = 1 shl 14
    NSWindowStyleMaskFullSizeContentView*    = 1 shl 15   

# GUI ANCHOR SYSTEM
const
    akNone*      = 0
    akRight*     = 1
    akWidth*     = 2
    akLeft*      = 4
    akBottom*    = 8
    akHeight*    = 16
    akFull*      = 18
    akTop*       = 32

    # Flags for GUI Anchor System

    # akNone       No Anchor
    # akRight      Anchor to Right of Window
    # akWidth      Anchor to Left and Right (width)
    # akLeft       Anchor to Left
    # akBottom     Anchor to Bottom
    # akHeight     Anchor to Top and Bottom
    # akFull       Anchor to Left/Right/Top/Bottom
    # akTop        Anchor to Top


# GUI OBJECTS
proc newWindow*(title: cstring, width, height: int, style: int): ID {.importc: "createWindow".}
proc newButton*(parent: ID; caption: cstring; left: cint; top: cint; width: cint; height: cint; `func`: ACTION): ID  {.cdecl, importc: "createButton".}
proc newCheckBox*(parent: ID, caption: cstring, left, top, width, height:int): ID {.cdecl, importc: "createCheckBox".}
proc newComboBox*(parent: ID; left: cint; top: cint; width: cint; height: cint; `callback`: ACTION): ID {.cdecl, importc: "createComboBox".}
proc newSeparator*(parent: ID; x: cint; y: cint; width: cint): ID {.cdecl, importc: "createLine".}
proc newLabel*(parent: ID; txt: cstring, left, top, width, height: int): ID {.cdecl, importc: "createLabel".}
proc newLine*(parent: ID, left, top, width: cint): ID {.cdecl, importc: "createLine".}
proc newListBox*(parent: ID, left, top, width, height: cint): ID {.cdecl, importc: "createListBox".}
proc newRadioButton*(parent: ID, caption: cstring; left: cint; top: cint; width: cint; height: cint; callback: ACTION): ID  {.cdecl, importc: "createRadioButton".}
proc newSlider*(parent: ID; left, top, width, height: int, `func`: ACTION): ID {.cdecl, importc: "createSlider".}
proc newTableview*(parent: ID, left, top, width, height: cint): ID {.cdecl, importc: "createTableView".}
proc newTextEdit*(parent: ID; txt: cstring, left, top, width, height: int): ID {.cdecl, importc: "createTextEdit".}
proc newTextField*(parent: ID; txt: cstring; left: cint; top: cint; width: cint; height: cint): ID  {.cdecl, importc: "createTextField".}
proc newStatusBar*(resource: cstring): ID {.cdecl, importc: "createStatusBar".}
proc newStatusMenu*(): ID {.cdecl, importc: "createStatusMenu".}
proc newStatusMenuItem*(parent: ID, tag: int, title: cstring, callback: ACTION) {.cdecl, importc: "createStatusItem".}


# GUI Containers
proc newTabBox*(parent: ID, label: cstring; left: cint; top: cint; width: cint; height: cint): ID  {.cdecl, importc: "createTabView".}
proc newContainer*(parent: ID, title: cstring; left: cint; top: cint; width: cint; height: cint): ID  {.cdecl, importc: "createBox".}

# DIALOGS
proc newDialog*(title, message: cstring, height: cint): cint {.cdecl, importc: "createDialog".}
proc newMessageBox*(title, message: cstring, height: cint): cint {.cdecl, importc: "createMessageBox".}
proc newOpenDialog*(parent: ID, types: cstring): cstring {.cdecl, importc: "createOpenDialog".}
proc newSaveDialog*(parent: ID, title: cstring, types: cstring): cstring {.cdecl, importc: "createSaveDialog".}

# Notifications
proc Notify*(title: cstring; subtitle: cstring; text: cstring) {.cdecl, importc: "Notify".}

# Cocoa Runtime Functions
proc Cocoa_Init*() {.cdecl, importc: "Cocoa_Init".}
proc Cocoa_Run*(a2: ID) {.cdecl, importc: "Cocoa_Run".}
proc Cocoa_Quit*(a2: ID) {.cdecl, importc: "Cocoa_Quit".}
proc Cocoa_About*() {.cdecl, importc: "Cocoa_About".}

# MENU
proc newMenu*(title: cstring): ID {.cdecl, importc: "createMenu".}
proc newMenuItem*(parent: ID, caption, key: cstring, `callback`:ACTION) {.cdecl, importc: "createMenuItem".}
proc newMenuSeparator*(parent: ID) {.cdecl, importc: "createMenuSeparator".}
proc setSystemAction*(widget: ID, title, actionName: cstring) {.cdecl, importc: "setSystemAction".}
proc newFileMenu*() {.cdecl, importc: "createFileMenu".}
proc newEditMenu*() {.cdecl, importc: "createEditMenu".}
proc newFormatMenu*() {.cdecl, importc: "createFormatMenu".}

# Common Functions
proc `anchor=`*(widget: ID; value: cint) {.cdecl, importc: "Pin".}
proc `text=`*(widget: ID; txt: cstring) {.cdecl, importc: "SetText".}
proc text*(widget: ID): cstring {.cdecl, importc: "GetText".}
proc value*(widget: ID): cint {.cdecl, importc: "GetValue".}
proc `value=`*(widget: ID; value: cint) {.cdecl, importc: "SetValue".}
proc add*(widget: ID; txt: cstring) {.cdecl, importc: "AddItem".}
proc `action=`*(widget: ID; `func`: ACTION) {.cdecl, importc: "SetAction".}
proc `state=`*(widget: ID; state: bool) {.cdecl, importc: "SetState".}
proc state*(widget: ID): cint {.cdecl, importc: "State".}
proc clear*(widget: ID) {.cdecl, importc: "LB_Clear".}
proc `item=`(widget: ID; pos: cint) {.cdecl, importc: "SetItem".}
proc remove*(widget: ID; pos: cint) {.cdecl, importc: "RemoveItem".}
proc link*( widget: ID, widgetIvar: cstring, target: ID, targetIvar: cstring) {.cdecl, importc:"bindWidget".}
proc `tooltip=`*(widget: ID, tip: cstring) {.cdecl, importc: "setToolTip".}

# TableView Functions
proc addColumn*(parent: ID, name: cstring) {.cdecl, importc: "newTableColumn".}
proc addRow*(parent: ID, person: cstring) {.cdecl, importc: "addRow".}
proc saveTableView*(tview: ID, path: cstring) {.cdecl, importc: "tableviewSaveToFile".}
proc loadTableView*(tview: ID, path: cstring) {.cdecl, importc: "tableviewLoadFromFile".}

# TabView Functions
proc addTab*(parent: ID, label: cstring) {.cdecl, importc: "addTab".}
proc getTab*(parent: ID, label: cstring): ID {.cdecl, importc: "getTab".}

# StatusBar Functions
proc separator*(parent: ID) {.cdecl, importc: "addSeparator".}
proc setStatusMenu*(parent, menu: ID) {.cdecl,importc: "setMenu".}
proc tag*(widget: ID): int {.cdecl, importc: "tag".}
proc Status_Init*() {.cdecl, importc: "Status_Init".}
proc `menu=`*(parent,widget: ID ) =
  parent.setStatusMenu(widget)

  
# ***********
# ** TO-DO **
# ***********

## Color
# proc getColor*(panel: ID): cstring {.cdecl, importc: "getColor".}
# proc hexColor*(cPanel: ID): cstring {.cdecl, importc: "hexColor".}

# ## Fonts [NSFont]
# proc `font=`*(parent: ID, fontname: cstring) # [SETTER]
# proc font*(parent: ID) # [GETTER]

# ## Images [NSImage]
# proc newImageView*(parent: ID) # [NSObject]
# proc `image=`*(parent: ID, image: cstring) # [SETTER]
# proc image*(parent: ID, image: cstring) # [GETTER]


# proc eventCallback*(widget: ID, callback: EVENTACTION) {.cdecl, importc: "eventAction".}







