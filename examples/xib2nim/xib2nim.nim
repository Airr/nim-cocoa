import xmlparser, xmltree, strutils


type
    Gui* = object
        class*:      string
        parent*:     string
        function*:   string
        ident*:      string
        caption*:    string
        widget*:     string
        left*:       string
        top*:        string
        width*:      string
        height*:     string
        callback*:   string


var 
    gui: seq[Gui]
    widgetNames: string
    wid: Gui
    header = """
import Cocoa

$#

const
    winstyle =  NSWindowStyleMaskTitled or 
                NSWindowStyleMaskClosable or 
                NSWindowStyleMaskMiniaturizable or 
                NSWindowStyleMaskResizable

var self:       GUI

Cocoa_Init()

"""

proc parseXib(xibFile: string): XmlNode =
    let xib = loadXml(xibFile)
    var xNode: XmlNode

    for win in xib.findAll("window"):        
        wid.function =  "new" & capitalizeAscii(win.tag)
        wid.class = "NS" & capitalizeAscii(win.tag)
        wid.ident = win.attr("identifier")
        wid.caption = win.attr("title")
        wid.width = win.child("view").child("rect").attr("width")
        wid.height = win.child("view").child("rect").attr("height")

        gui.add(wid)

        widgetNames.add("type\n")
        widgetNames.add("    Gui* = object\n")
        widgetNames.add("        $#:    ID\n" % [wid.ident])
        xNode = win

    result = xNode


proc parseXib(winNode: XmlNode) =
    for item in winNode.findAll("subviews")[0]:
        var widget: Gui
        
        if item.tag == "textView": continue
        if item.tag == "scrollView":
            case item.child("clipView").child("subviews")[0].tag:
                of "textView":
                    item.tag = "textEdit"
                of "tableView":
                    item.tag = "listBox"
                else:
                    item.tag = item.child("clipView").child("subviews")[0].tag

        case item.tag: 
            of "textField":
                if item.child("textFieldCell").child("color").attr("name") == "labelColor":
                    item.tag="label"
                    widget.caption = item.child("textFieldCell").attr("title")

            of "button":
                widget.caption = item.child("buttonCell").attr("title")
                if item.child("buttonCell").attr("type") == "check":
                    item.tag="checkBox"
                    

        widget.function = "new" & capitalizeAscii(item.tag)
        widget.class    = "NS" & capitalizeAscii(item.tag)
        widget.parent = wid.ident
        widget.ident = item.attr("identifier")
        widget.left = item.child("rect").attr("x")
        widget.width = item.child("rect").attr("width")
        widget.height = item.child("rect").attr("height")
        widget.top = $(wid.height.parseInt - item.child("rect").attr("y").parseInt - widget.height.parseInt)

        case item.tag
            of "button", "comboBox", "slider", "checkBox":
                widget.callback = "nil"

        widgetNames.add("        $#:    ID\n" % [widget.ident])
        gui.add(widget)


proc main() =
    var cmd, footer: string

    var xib = parseXib("demo.xib")
    parseXib(xib)

    cmd.add(header % [widgetNames])

    for obj in gui:
        case obj.class:
            of "NSWindow":
                cmd.add("self.$# = $#(\"$#\", $#, $#, winStyle)\n" % [obj.ident, obj.function, obj.caption, obj.width, obj.height])
                footer = "\n\nCocoa_Run(self.$#)\n" % [obj.ident]
            of "NSButton":
                cmd.add("self.$# = $#(self.$#, \"$#\", $#, $#, $#, $#, $#)\n" % [obj.ident, obj.function, obj.parent, obj.caption, obj.left, obj.top, obj.width, obj.height, obj.callback])
            of "NSComboBox", "NSSlider":
                cmd.add("self.$# = $#(self.$#, $#, $#, $#, $#, $#)\n" % [obj.ident, obj.function, obj.parent, obj.left, obj.top, obj.width, obj.height, obj.callback])
            of "NSTextEdit":
                cmd.add("self.$# = $#(self.$#, \"$#\", $#, $#, $#, $#)\n" % [obj.ident, obj.function, obj.parent, obj.caption, obj.left, obj.top, obj.width, obj.height])
                cmd.add("\nnewEditMenu()\nnewFormatMenu()\n")
            else:
                cmd.add("self.$# = $#(self.$#, \"$#\", $#, $#, $#, $#)\n" % [obj.ident, obj.function, obj.parent, obj.caption, obj.left, obj.top, obj.width, obj.height])

    cmd.add(footer)

    writeFile("IBDemo.nim",cmd)



when isMainModule:
    main()