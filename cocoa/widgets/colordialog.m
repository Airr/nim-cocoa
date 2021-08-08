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

id getColor(id panel) {
    return theColor;
}

void setColor(id target, id source) {
    [target setBackgroundColor: [source color]];
}