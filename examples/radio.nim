import Cocoa

const
    winStyle = NSWindowStyleMaskTitled or NSWindowStyleMaskClosable

var win, radio1, radio2, radio3, radioContainer, tab, lbl1: ID

proc radioCB(sender: ID) {.cdecl.} =
    lbl1.text = "Selected: " & $sender.text

Cocoa_Init()
win = newWindow("NimCocoa Radio Button Demo", 300, 200, winStyle)


radio1 = newRadioButton(win,"Radio 1",20,20,100,24,radioCB)
radio2 = newRadioButton(win,"Radio 2",20,45,100,24,radioCB)
radio3 = newRadioButton(win,"Radio 3",20,70,100,24,radioCB)
lbl1 = newLabel(win, "Selected: None", 20, 145, 200,24)

Cocoa_Run(win)