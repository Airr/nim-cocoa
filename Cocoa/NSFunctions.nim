{.compile: "widgets/functions.m".}

type
    ID* = pointer
    ACTION* = proc (a2: ID) 
    
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

proc `anchor=`*(widget: ID; value: cint) {.cdecl, importc: "Pin".}
proc Cocoa_Init*() {.cdecl, importc: "Cocoa_Init".}
proc Cocoa_Run*() {.cdecl, importc: "Cocoa_Run".}
proc `text=`*(widget: ID; txt: cstring) {.cdecl, importc: "SetText".}
proc `text`*(widget: ID): cstring {.cdecl, importc: "GetText".}
proc `item=`*(widget: ID; txt: cstring) {.cdecl, importc: "AddItem".}
proc `item`*(widget: ID) {.cdecl, importc: "GetItem".}
proc `value=`*(widget: ID, value: cint) {.cdecl, importc: "SetValue".}
proc `value`*(widget: ID): cint {.cdecl, importc: "GetValue".}


# proc `text=`*(widget: ID; txt: cstring) =
#   widget.SetText(txt)

# proc `text`*(widget: ID): cstring =
#   GetText(widget)

# proc `item`*(widget: ID): cstring =
#   GetItem(widget)
  
# proc `anchor=`*(widget: ID; value: cint) =
#   widget.AutoSizeMask(value)

# proc `value=`*(widget: ID, value: cint) =
#   widget.SetValue(value)

# proc `value`*(widget: ID): cint =
#   result = widget.GetValue()