# Const

### `NSWindowStyleMask` constants are used to determine the type of window that is created via then newWindow() proc, and should be self explanatory.

### StyleMasks are typically `or'd` together

## NSWindowStyleMaskBorderless*             NSWindowStyleMaskTitled*                 NSWindowStyleMaskClosable*               NSWindowStyleMaskMiniaturizable*         NSWindowStyleMaskResizable*              NSWindowStyleMaskUtilityWindow*          NSWindowStyleMaskDocModalWindow*         NSWindowStyleMaskNonactivatingPanel*     NSWindowStyleMaskUnifiedTitleAndToolbar* NSWindowStyleMaskHUDWindow*              NSWindowStyleMaskFullScreen*             NSWindowStyleMaskFullSizeContentView*

```nim
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
```

____

# Flags for the GUI Anchor System

### These flags inform the GUI object how they should react when the window is resized.

### There is no need for a box/container paradigm because of this.  You can determine both how a widget resizes, and how it 'flows' on resize events. Below is a breakdown of what each flag does.



## # akNone                 No Anchor

## # akRight                 Anchor to Right of Window

## # akWidth                Anchor to Left and Right (width)

## # akLeft                    Anchor to Left

## # akBottom             Anchor to Bottom

## # akHeight              Anchor to Top and Bottom

## # akFull                    Anchor to Left/Right/Top/Bottom

## # akTop                    Anchor to Top

```nim
akNone*      = 0
akRight*     = 1
akWidth*     = 2
akLeft*      = 4
akBottom*    = 8
akHeight*    = 16
akFull*      = 18
akTop*       = 32
```

____

____

# Procs

## Cocoa_Init*

```nim
proc Cocoa_Init*() {.cdecl, importc: "Cocoa_Init".}
```

#### **REQUIRED**

#### Initializes the Cocoa Runtime.  Place before any GUI instantiation.

____

## Cocoa_Run*

```nim
proc Cocoa_Run*(a2: ID) {.cdecl, importc: "Cocoa_Run".}
```

#### **REQUIRED**

#### Launches the Cocoa Runtime. Place after GUI instantiation is complete, passing the mainwindow as a parameter.

____

## Cocoa_Quit*

```nim
proc Cocoa_Quit*(a2: ID) {.cdecl, importc: "Cocoa_Quit".}
```

### Exits the Cocoa Runtime when early exit is desired.

____

## Cocoa_About*

```nim
proc Cocoa_About*() {.cdecl, importc: "Cocoa_About".}
```

### Shows an About dialog

____

## anchor=*

```nim
proc `anchor=`*(widget: ID; value: cint) {.cdecl, importc: "Pin".}
```

### Used to set the anchor flags for an object

____

## text=*

```nim
proc `text=`*(widget: ID; txt: cstring) {.cdecl, importc: "SetText".}
```

### Sets the text/label of an object

____

## text*

```nim
proc text*(widget: ID): cstring {.cdecl, importc: "GetText".}
```

### Retrieves the text/label value of an object

____

## value*

```nim
proc value*(widget: ID): cint {.cdecl, importc: "GetValue".}
```

### Retrieves the numerical value of an object

____

## value=*

```nim
proc `value=`*(widget: ID; value: cint) {.cdecl, importc: "SetValue".}
```

### Sets the numerical value of an object

____

## add*

```nim
proc add*(widget: ID; txt: cstring) {.cdecl, importc: "AddItem".}
```

### Adds a string value to a Combobox/Listbox

____

## `action=`*

```nim
proc `action=`*(widget: ID; `func`: ACTION) {.cdecl, importc: "SetAction".}
```

### Sets the callback proc for an object that supports callbacks

____

## state=*

```nim
proc `state=`*(widget: ID; state: bool) {.cdecl, importc: "SetState".}
```

### Sets the state of RadioButton/Checkbox objects

____

## state*

```nim
proc state*(widget: ID): cint {.cdecl, importc: "State".}
```

### Retrieves the state of RadioButton/Checkbox objects

____

## clear*

```nim
proc clear*(widget: ID) {.cdecl, importc: "LB_Clear".}
```

### Clears a ListBox object

____

## `item=`

```nim
proc `item=`(widget: ID; pos: cint) {.cdecl, importc: "SetItem".}
```

### Not Used

____

## remove*

```nim
proc remove*(widget: ID; pos: cint) {.cdecl, importc: "RemoveItem".}
```

### Not Used

---____

## getColor*

```nim
proc getColor*(panel: ID): cstring {.cdecl, importc: "getColor".}
```

### Not Used

---____

## hexColor*

```nim
proc hexColor*(cPanel: ID): cstring {.cdecl, importc: "hexColor".}
```

### Not Used

---____

## Notify*

```nim
proc Notify*(title: cstring; subtitle: cstring; text: cstring) {.cdecl, importc: "Notify".}
```

### Sends Notification to the macOS Notification Center

____

## newSeparator*

```nim
proc newSeparator*(parent: ID; x: cint; y: cint; width: cint): ID {.cdecl, importc: "createLine".}
```

### Creates a line to separate objects on a window form

____
