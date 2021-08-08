import Cocoa

const
    width = 800
    height = 600
    winStyle = NSWindowStyleMaskTitled or 
               NSWindowStyleMaskClosable or 
               NSWindowStyleMaskMiniaturizable or 
               NSWindowStyleMaskResizable

var mainWindow, txt1, btn1, combo, chkbox, label1, slider1, editor: ID

proc btnClicked(sender:ID) {.cdecl.} =
    let fName = newOpenDialog(mainWindow, "nim")
    if fName.len > 0:
        txt1.text = fName
        let fText = readFile($fName)
        editor.text = fText
        
proc sliderCallback(sender: ID) {.cdecl.} =
    echo label1.text

proc main() =
    Cocoa_Init()

    mainWindow = newWindow("Nim Cocoa Module GUI Test", width, height, winStyle)
    txt1 = newTextField(mainWindow,"Welcome to AIR's Cocoa Demo", 16, 20, width-122, 22)
    btn1 = newButton(mainWindow, "Open", width-100, 20, 90, 24, btnClicked)
    combo = newComboBox(mainWindow, 16,54,210,26, nil)
    for item in ["One", "Two", "Three"]: combo.add(item)    
    combo.text = "Two"

    chkbox = newCheckBox(mainWindow,"Check Box 1", 240, 54, 100, 24)
    label1 = newLabel(mainWindow,"This is a Label", 360, 57, 100, 24)
    slider1 = newSlider(mainWindow, 680, 57, 100, 24, sliderCallback)
    slider1.value = 1
    editor = newTextEdit(mainWindow, "", 16, 96, width-32, height-120)

    txt1.anchor = akWidth
    btn1.anchor = akRight
    editor.anchor = akFull

    Cocoa_Run(mainWindow)

when isMainModule:
  main()
