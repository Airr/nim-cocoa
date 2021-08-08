#import <Cocoa/Cocoa.h>

#import "col.h"

@interface CocoaCheckbox : NSButton 
    {
        int state;
    }
    @property int state;
    - (void) click:(id)sender;
@end

@implementation CocoaCheckbox

    @synthesize state;

    - (id)initWithFrame:(NSRect)frame {
        self = [super initWithFrame:frame];
        if (self) {
            [self setButtonType:NSSwitchButton];
            [self setBezelStyle: 0];
            
            [self setTarget: self];
            [self setAction: @selector(click:)];
        }
        return self;
    }

    - (void) click:(id)sender {
        self.state = [self intValue];
    }
@end

id createCheckBox(id parent, const char* caption, int l, int t, int w, int h){
    id self = [[[CocoaCheckbox alloc] initWithFrame:NSMakeRect( l, t, w, h )] autorelease];
    [self setTitle: [NSString stringWithUTF8String:caption]];

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
