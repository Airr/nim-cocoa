#import <Cocoa/Cocoa.h>

#import "col.h"

@implementation RadioButton

	@synthesize buttonAction;


	- (void) click:(id)sender {
		buttonAction(sender);
    }
@end

id createRadioButton(id parent, const char* caption, int l, int t, int w, int h, ACTION func){
    NSButton *self = [[[RadioButton alloc] initWithFrame:NSMakeRect( l, t, w, h )] autorelease];
    [self setButtonType: NSButtonTypeRadio];
    [self setBezelStyle: 0];
    [self setTitle: [NSString stringWithUTF8String:caption]];
    [self setTarget: self];

    if (func) {
    	[self setButtonAction:func];
    	[self setAction: @selector(click:)];
    }
    [[parent contentView] addSubview:self];
    return self;
}