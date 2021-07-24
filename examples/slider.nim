import Cocoa

const 
  width = 320
  height = 100
  winStyle = NSWindowStyleMaskTitled or NSWindowStyleMaskClosable or NSWindowStyleMaskMiniaturizable or NSWindowStyleMaskResizable

var mainWindow, label, slider: ID

proc sliderCB(sender: ID) {.cdecl.} =
  label.text = "Slider Value: " & $slider.value

proc main() =

  Cocoa_Init()

  mainWindow = newWindow("Nim Mac GUI Slider Demo", width, height, winStyle)
  label = newLabel(mainWindow,"Slider Value: 0", 16,20,120,24)
  label.anchor = akWidth 
  slider = newSlider(mainWindow, 16,40,width-40,24, sliderCB)
  slider.anchor = akWidth


  Cocoa_Run(mainWindow)

when isMainModule:
  main()
