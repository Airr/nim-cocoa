#import <Cocoa/Cocoa.h>
#import "col.h"

@implementation CocoaSlider
{

}
@synthesize Value;
@synthesize sliderAction;

- (IBAction)onChanged:(id)sender{
    self.Value = [sender intValue];
    sliderAction(sender);
}

- (id) initWithFrame:(NSRect)rect callBack:(ACTION)callback  {
    self = [super initWithFrame: rect];
    [self setMinValue:0];
    [self setMaxValue:100];
    [self setAllowsTickMarkValuesOnly:NO];
    [self setNumberOfTickMarks:0];
    [self setTickMarkPosition:1];
    [self setTarget:self];
    [self setContinuous: YES];
    if (callback != NULL) {
        [self setSliderAction: callback];
        [self setAction: @selector(onChanged:)];
    }
    return self;
}
@end

id createSlider(id parent, int left, int top, int width, int height, ACTION callback) {
    id widget = [[CocoaSlider alloc] initWithFrame:NSMakeRect(left, top, width, height) callBack:callback];

    addToParent(parent, self);
    return widget;
}
