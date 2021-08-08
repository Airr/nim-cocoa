#import <Cocoa/Cocoa.h>

#import "col.h"


id createBox(id parent, const char* title, int x, int y, int width, int height) {
    id widget = [[[NSBox alloc] initWithFrame: NSMakeRect(x, y, width, height)] autorelease];
    [widget setTitle: [NSString stringWithUTF8String: title]];

    // Do we need to create a contentView???
    id sv = [[[SaneView alloc] initWithFrame: NSZeroRect] autorelease];
    [sv setBackgroundColor: [NSColor windowBackgroundColor]];
    [widget setContentView: sv];
    [widget setBorderType: NSLineBorder];
    addToParent(parent, widget);
    return widget;
}