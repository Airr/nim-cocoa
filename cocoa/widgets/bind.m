#import <Cocoa/Cocoa.h>


void bind( id widget, const char * widgetIvar, id target, const char *targetIvar) {
    [widget bind: [NSString stringWithUTF8String: widgetIvar] toObject: target withKeyPath:[NSString stringWithUTF8String: targetIvar] options:nil];
}