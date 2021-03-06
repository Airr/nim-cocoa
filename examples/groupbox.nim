import Cocoa

const
    winStyle = NSWindowStyleMaskTitled or NSWindowStyleMaskClosable

var win, radio1, radio2, radio3, radioContainer, tab, lbl1: ID

proc radioCB(sender: ID) {.cdecl.} =
    lbl1.text = "Selected: " & $sender.text

Cocoa_Init()
win = newWindow("NimCocoa Group Box Demo", 300, 200, winStyle)
# tab = newTabBox(win,"First|Second|Third", 10, 10, 280, 160)
# # for x in ["Second", "Third"]: tab.addTab(x)
# tab.addTab("Fourth")
    
radioContainer = newContainer(win, "Radio Buttons",20,20,200,120)

radio1 = newRadioButton(radioContainer,"Radio 1",10,10,100,24,radioCB)
radio2 = newRadioButton(radioContainer,"Radio 2",10,35,100,24,radioCB)
radio3 = newRadioButton(radioContainer,"Radio 3",10,60,100,24,radioCB)
lbl1 = newLabel(win, "Selected: None", 20, 145, 200,24)

Cocoa_Run(win)