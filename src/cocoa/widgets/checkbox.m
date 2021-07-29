#import <Cocoa/Cocoa.h>

#import "col.h"




id createCheckBox(id parent, const char* caption, int l, int t, int w, int h){
    NSButton *self = [[[NSButton alloc] initWithFrame:NSMakeRect( l, t, w, h )] autorelease];
    [self setButtonType:NSSwitchButton];
    [self setBezelStyle: 0];
    [self setTitle: [NSString stringWithUTF8String:caption]];
    [self setTarget: self];

    addToParent(parent, self);
    
    return self;
}

void SetState(id widget, bool state) {
	if (state == TRUE) {
		[widget setState: NSOnState];
	}else{
		[widget setState: NSOffState];
	}
}

int State(id widget) {
	return [widget state];
}
