#import <Cocoa/Cocoa.h>

#import "col.h"

id createTextField(id parent, const char* txt, int l, int t, int w, int h){
    NSTextField *widget = [[[NSTextField alloc] initWithFrame:NSMakeRect( l, t, w, h )] autorelease];
    [widget setStringValue:[NSString stringWithUTF8String:txt]];
//     [widget setAutoresizingMask: NSViewWidthSizable];
    [[parent contentView] addSubview:widget];
    return widget;
}
