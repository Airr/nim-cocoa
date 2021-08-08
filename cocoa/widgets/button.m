#import <Cocoa/Cocoa.h>

#import "col.h"




@implementation CocoaButton

	@synthesize buttonAction;


	- (void) click:(id)sender {
		buttonAction(sender);
}
@end

id createButton(id parent, const char* caption, int l, int t, int w, int h, ACTION func){
    CocoaButton *widget = [[[CocoaButton alloc] initWithFrame:NSMakeRect( l, t, w, h )] autorelease];
    [widget setButtonType:NSMomentaryPushInButton];
    [widget setBezelStyle: NSRoundedBezelStyle];
    [widget setTitle: [NSString stringWithUTF8String:caption]];
    [widget setTarget: widget];
//     [widget setAutoresizingMask: NSViewMinXMargin ];
    
    if (func) {
    	[widget setButtonAction:func];
    	[widget setAction: @selector(click:)];
    }
    addToParent(parent, widget);
    
    return widget;
}

