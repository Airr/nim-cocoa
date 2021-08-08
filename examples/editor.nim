import Cocoa 

const
    winStyle = NSWindowStyleMaskTitled or 
               NSWindowStyleMaskClosable or 
               NSWindowStyleMaskMiniaturizable or 
               NSWindowStyleMaskResizable

    width  = 800
    height = 600

type
    GUI = object
        window:    ID
        editor:    ID

var self: GUI

proc openClicked(sender:ID) {.cdecl.} =
    let fName = newOpenDialog(self.window, "nim")
    if fName.len > 0:
        let fText = readFile($fName)
        self.editor.text = fText

proc setupMenus() =
    var f = newMenu("File")
    newMenuItem(f, "New","n",nil)
    newMenuItem(f, "Open...","o", openClicked)
    newMenuSeparator(f)
    newMenuItem(f, "Close","w",nil)
    newMenuItem(f, "Save","s",nil)
    newMenuItem(f, "Save As...","S",nil)
    newMenuSeparator(f)
    newMenuItem(f, "Page Setup...","P",nil)
    newMenuItem(f, "Print...","p",nil)

    newEditMenu()
    newFormatMenu()


Cocoa_Init()

self.window = newWindow("Template", width, height, winStyle)
self.editor = newTextEdit(self.window,"", 20, 20, width-40, height-40)
self.editor.anchor = akFull
setupMenus()

Cocoa_Run(self.window)

