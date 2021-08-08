import Cocoa 

const
    winStyle = NSWindowStyleMaskTitled or NSWindowStyleMaskClosable

type
    GUI = object
        win:    ID
        label:  ID
        chk:    ID
        slider: ID
        txt:    ID

var self: GUI

Cocoa_Init()

self.win = newWindow("Cocoa Bindings Demo 1", 462, 128, winStyle)

self.chk = newCheckBox(self.win, "Enabled?", 18, 18, 78, 22) #iVar="state"
self.txt = newTextField(self.win, "", 102, 18, 340, 22)
self.slider = newSlider(self.win, 18, 48, 428, 19, nil) #iVar="Value"

# Bind TextBox and Slider value
# Each can update the other
self.txt.link("value",self.slider,"Value")
self.slider.link("value", self.slider,"Value")

# Bind Checkbox and Slider state. 
# Checkbox controls enabled/disabled state of Slider!
self.slider.link("enabled", self.chk,"state")

Cocoa_Run(self.win)
