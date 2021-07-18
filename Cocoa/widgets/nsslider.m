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

- (id) initWithFrame:(NSRect)rect callBack:(ACTION)func  {
    self = [super initWithFrame: rect];
    [self setMinValue:0];
    [self setMaxValue:100];
    [self setAllowsTickMarkValuesOnly:NO];
    [self setNumberOfTickMarks:0];
    [self setTickMarkPosition:1];
    [self setTarget:self];
    if (func != NULL) {
        [self setSliderAction: func];
        [self setAction: @selector(onChanged:)];
    }
    return self;
}
@end
