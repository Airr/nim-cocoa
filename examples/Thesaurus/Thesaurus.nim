import cocoa, strutils,  strtabs, functions

let wintitle:cstring = "Thesaurus"
let width:cint = 540
let height:cint = 480
let button_width:cint = 90
let dict_servers = "dict.org dict.us.dict.org dict0.us.dict.org".split
let winStyle = NSWindowStyleMaskTitled or NSWindowStyleMaskClosable or NSWindowStyleMaskMiniaturizable or NSWindowStyleMaskResizable

var
  mainwin, lblDropList, drop, fetch: ID
  lblControl, about, btnClear, exbut: ID
  lblDictionary, lbList, lblText, tbText: ID
  txtEntry, btnSearch, sep1: ID
  servers: StringTableRef

proc getServers(widget:ID) {.cdecl.} =
  servers = getDics()

  for key in servers.keys:
    lbList.add key

proc getWord(widget: ID) {.cdecl.} =
  var selectedDict = $lbList.text
  tbText.text = getDefinition(servers[selectedDict], $txtEntry.text)
  var txt:string =  $wintitle & " - \"" & $txtEntry.text & "\""
  mainwin.text = txt

proc Clear(widget: ID) {.cdecl.} =
  tbText.reset
  mainwin.text = wintitle
  txtEntry.reset
  lbList.clear


Cocoa_Init()

mainwin = newWindow(wintitle, width, height, winStyle )

lblDropList = newLabel(mainwin,"Servers", 16,16,button_width,26)
drop = newComboBox(mainwin,16, 36,130,26,nil)
fetch = newButton(mainwin,"Refresh",150,36,button_width,26,getServers)
for item in dict_servers:
  drop.add(item)
drop.text = "dict.org"


# Create control panel
lblControl = newLabel(mainwin,"Control", 420,16,button_width,26)
# about = newButton(mainwin,"About", 260,36, button_width,26,nil)
btnClear = newButton(mainwin,"Clear", 350,36, button_width,26,Clear)
exbut = newButton(mainwin,"Exit", 440,36, button_width,26,Cocoa_Quit)
sep1 = newSeparator(mainwin,16,72,width-32)
sep1.anchor = akWidth

lblControl.anchor = akRight
about.anchor = akRight
btnClear.anchor = akRight
exbut.anchor = akRight

# Create dictionary panel
lblDictionary = newLabel(mainwin,"Dictionaries", 16,80,button_width,26)
lbList = newListBox(mainwin, 16, 100, 508, 140)
lbList.anchor = akWidth

# Create text part
lblText = newLabel(mainwin,"Translation", 16,250,button_width,26)
tbText = newTextEdit(mainwin,"",16,270, 508,140)
tbText.anchor = akFull

# Create entry and lookup button
txtEntry = newTextField(mainwin,"",16,430,420,22)
btnSearch = newButton(mainwin,"Search",440,430, button_width,24,getWord)
txtEntry.anchor = akWidth + akBottom
btnSearch.anchor = akRight + akBottom



Cocoa_Run(mainwin)
