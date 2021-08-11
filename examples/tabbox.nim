import Cocoa

const
    winStyle = NSWindowStyleMaskTitled or NSWindowStyleMaskClosable

var win, radio1, radio2, radio3, tab, lbl1: ID
var cbo: ID

proc radioCB(sender: ID) {.cdecl.} =
    lbl1.text = "Selected: " & $sender.text

proc comboCB(sender: ID) {.cdecl.} =
    lbl1.text = "Selected: " & $sender.text

Cocoa_Init()
win = newWindow("NimCocoa Tab Box Demo", 400, 200, winStyle)
tab = newTabBox(win,"First|Second", 10, 10, 380, 160)
# for x in ["Third","Fourth"]: tab.addTab(x)

var tabitem = tab.getTab("First")
radio1 = newRadioButton(tabitem,"Radio 1",10,10,100,24,radioCB)
radio2 = newRadioButton(tabitem,"Radio 2",10,35,100,24,radioCB)
radio3 = newRadioButton(tabitem,"Radio 3",10,60,100,24,radioCB)

lbl1 = newLabel(win, "Selected: None", 20, 170, 200,24)

tabitem = tab.getTab("Second")
cbo = newComboBox(tabitem,10,10,200,26, comboCB)
for x in ["Apples","Oranges","Peaches"]: cbo.add(x)
cbo.text = "Peaches"
    

Cocoa_Run(win)
