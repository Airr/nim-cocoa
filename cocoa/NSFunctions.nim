{.compile: "widgets/functions.m".}
{.compile: "widgets/bind.m".}

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

proc Cocoa_Init*() {.cdecl, importc: "Cocoa_Init".}

proc Cocoa_Run*(a2: ID) {.cdecl, importc: "Cocoa_Run".}

proc Cocoa_Quit*(a2: ID) {.cdecl, importc: "Cocoa_Quit".}

proc Cocoa_About*() {.cdecl, importc: "Cocoa_About".}
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
proc getColor*(panel: ID): cstring {.cdecl, importc: "getColor".}
proc hexColor*(cPanel: ID): cstring {.cdecl, importc: "hexColor".}

proc Notify*(title: cstring; subtitle: cstring; text: cstring) {.cdecl, importc: "Notify".}

proc newSeparator*(parent: ID; x: cint; y: cint; width: cint): ID {.cdecl, importc: "createLine".}

proc link*( widget: ID, widgetIvar: cstring, target: ID, targetIvar: cstring) {.cdecl, importc:"bindWidget".}

proc `tooltip=`*(widget: ID, tip: cstring) {.cdecl, importc: "setToolTip".}