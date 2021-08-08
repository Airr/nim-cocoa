import Cocoa

const
    winStyle = NSWindowStyleMaskTitled or NSWindowStyleMaskClosable

var win, radio1, radio2, radio3, radioContainer, tab, lbl1: ID
var cbo: ID

proc radioCB(sender: ID) {.cdecl.} =
    lbl1.text = "Selected: " & $sender.text

proc comboCB(sender: ID) {.cdecl.} =
    lbl1.text = "Selected: " & $sender.text

Cocoa_Init()
win = newWindow("NimCocoa Group Box Demo", 400, 200, winStyle)
tab = newTabBox(win,"First|Second|Third", 10, 10, 380, 160)
# # for x in ["Second", "Third"]: tab.addTab(x)
# tab.addTab("Fourth")
    
# radioContainer = newContainer(win, "Radio Buttons",20,20,200,120)
var tvitem = tab.getTab("First")
radio1 = newRadioButton(tvitem,"Radio 1",10,10,100,24,radioCB)
radio2 = newRadioButton(tvitem,"Radio 2",10,35,100,24,radioCB)
radio3 = newRadioButton(tvitem,"Radio 3",10,60,100,24,radioCB)

lbl1 = newLabel(win, "Selected: None", 20, 170, 200,24)

tvitem = tab.getTab("Second")
cbo = newComboBox(tvitem,10,10,200,26, comboCB)
for x in ["Apples","Oranges","Peaches"]: cbo.add(x)
cbo.text = "Apples"
    

Cocoa_Run(win)