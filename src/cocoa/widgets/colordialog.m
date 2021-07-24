#import <Cocoa/Cocoa.h>

#include "col.h"





@implementation awColorPanel 
    @synthesize theColor;

    - (void)colorUpdate:(awColorPanel*)colorPanel{ 
        theColor = colorPanel.color;
//         printf("%s\n",[self hexColor]);
    }

    - (const char *) hexColor {
        NSString* hexString = [NSString stringWithFormat:@"%02X%02X%02X", 
        (int) (theColor.redComponent * 0xFF), 
        (int) (theColor.greenComponent * 0xFF), 
        (int) (theColor.blueComponent * 0xFF)];
        return [hexString UTF8String];
    }
@end

id createColorDialog() {
    NSColorPanel *cp = [awColorPanel sharedColorPanel];
    [cp setTarget:cp];
    [cp setAction:@selector(colorUpdate:)];
    // [NSApp runModalForWindow: cp];
    [cp makeKeyAndOrderFront:nil];
 
    return cp;
   
}

const char* hexColor(awColorPanel* cPanel) {
    return [cPanel hexColor];
}
// @interface NSColorPanel (CPL)
// 
// - (void)disablePanel;
// - (void)enablePanel;
// + (NSString *)strColor;
// 
// @end
// 
// #include <tgmath.h>
// 
// static BOOL colorPanelEnabled = YES;
// 
// 
// @implementation NSColorPanel (CPL)
// 
// - (void)disablePanel {
// 	colorPanelEnabled = NO;
// }
// 
// - (void)enablePanel {
// 	colorPanelEnabled = YES;
// }

// - (void)orderFront:(id)sender {
// 	if (colorPanelEnabled) {
// 		NSColorPanel *panel = [BFColorPickerPopover sharedPopover].colorPanel;
// 		if (panel) {
// 			self.contentView = panel.contentView;
// 		}
// 		[super orderFront:sender];
// 	} else {
// 		// Don't do anything.
// 	}
// }

// + (NSString *)strColor {
// 	NSColorPanel *panel = [NSColorPanel sharedColorPanel];
// 	[panel orderFront:nil];
// 	NSColor *color = [panel.color colorUsingColorSpaceName: NSDeviceRGBColorSpace];
// 	return [NSString stringWithFormat:@"r: %d, g: %d, b: %d, a: %d",
// 			(int)round([color redComponent]*255),
// 			(int)round([color greenComponent]*255),
// 			(int)round([color blueComponent]*255),
// 			(int)round([color alphaComponent]*255)];
// // return @"";
// }
// @end

// const char* ColorDialog() {
// 	NSColorPanel *panel = [NSColorPanel sharedColorPanel];
// 	[panel orderFront:nil];
// 	NSString *aColor = [NSColorPanel strColor];
// 	return [[NSString stringWithFormat:@"r: %d, g: %d, b: %d, a: %d",
// 			(int)round([color redComponent]*255),
// 			(int)round([color greenComponent]*255),
// 			(int)round([color blueComponent]*255),
// 			(int)round([color alphaComponent]*255)] UTF8String];
//     return [aColor UTF8String];
// }    
