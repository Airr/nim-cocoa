#import <Cocoa/Cocoa.h>

#import "col.h"



@implementation CocoaComboBox

@synthesize currentItem;
@synthesize comboCallBack;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    	[self setEditable: NO];
    	[[NSNotificationCenter defaultCenter] 
    							addObserver:self
								selector:@selector(comboBoxSelectionDidChange:) 
								name:NSComboBoxSelectionDidChangeNotification
								object:self];
    }
    return self;
}

- (void)comboBoxSelectionDidChange:(NSNotification *)notification {
	// [self setCurrentItem: [self indexOfSelectedItem]];
    self.currentItem = [self indexOfSelectedItem];
    if (self.comboCallBack != NULL)  comboCallBack(self);
}
@end

id createComboBox(id parent,int l, int t, int w, int h, ACTION callback){
    id widget = [[[CocoaComboBox alloc] initWithFrame:NSMakeRect( l, t, w, h )] autorelease];
    if (callback) {
        [widget setComboCallBack:callback];
        // [widget setAction: @selector(click:)];
    }

    addToParent(parent, widget);
    
    return widget;
}

