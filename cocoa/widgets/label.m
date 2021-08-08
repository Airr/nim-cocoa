#import <Cocoa/Cocoa.h>

#import "col.h"

id createLabel(id parent, const char* txt, int l, int t, int w, int h){
    NSTextField *widget = [[[NSTextField alloc] initWithFrame:NSMakeRect( l, t, w, h )] autorelease];
    [widget setStringValue:[NSString stringWithUTF8String:txt]];
	[widget setEditable: NO];
	[widget setAlignment: NSTextAlignmentLeft];
	[widget setDrawsBackground: NO];
	[widget setBordered: NO];
    addToParent(parent, widget);
    return widget;
}
