#import <Cocoa/Cocoa.h>

#import "col.h"

@implementation AppDelegate : NSObject


- (void)applicationDidFinishLaunching: (NSNotification *)notification
{
    [[NSUserNotificationCenter defaultUserNotificationCenter] setDelegate:self];
}
 
- (BOOL)applicationShouldTerminateAfterLastWindowClosed: (NSNotification *)notification
{
      return YES;
}

- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center shouldPresentNotification:(NSUserNotification *)notification
{
    return YES;
}

@end
