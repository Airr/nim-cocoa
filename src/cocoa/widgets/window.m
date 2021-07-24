#import <Cocoa/Cocoa.h>

#import "col.h"




@implementation CocoaWindow : NSWindow

  NSMenuItem* item;
  NSMenu* subMenu;

-(id) initFormWithTitle:(NSString*)title width:(NSInteger)width height:(NSInteger)height windowStyle: (NSWindowStyleMask) style
{
  self = [super initWithContentRect: NSMakeRect(0, 0, width, height)
                styleMask: style //(NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable)
                // styleMask: (NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask)
                backing: NSBackingStoreBuffered
                defer: NO];
  if (self) {  
    SaneView *sv;
    sv = [[SaneView alloc] initWithFrame: [[self contentView] frame]];
    [self setContentView:sv];
    [sv setBackgroundColor: [NSColor windowBackgroundColor]];        
    [self setTitle: title];
    [self center];
    [self setMinSize: NSMakeSize(width,height)];
    [self setInitialFirstResponder: nil];
    [self setAutorecalculatesKeyViewLoop: YES];
    [self makeKeyAndOrderFront:nil];
    [self createApplicationMenu];


  }
  return self;
}

- (void)createApplicationMenu {
    // Create MenuBar
    id menubar = [[NSMenu new] autorelease];
    id appMenuItem = [[NSMenuItem new] autorelease];
    [menubar addItem:appMenuItem];
    [NSApp setMainMenu:menubar];

    // Create Application Menu   
    id appMenu = [[NSMenu new] autorelease];
    id appName = [[NSProcessInfo processInfo] processName];

   // About Menu
    id aboutMenu =[[[NSMenuItem alloc] initWithTitle:[@"About " stringByAppendingString:appName] 
                              action:@selector(orderFrontStandardAboutPanel:) 
                              keyEquivalent:@""] 
                              autorelease];
    [appMenu addItem:aboutMenu];

   // Preferences Menu
    id prefMenu = [[[NSMenuItem alloc] initWithTitle:@"Preferences…" 
                                action:NULL keyEquivalent:@","]
                                autorelease];
    [prefMenu setTarget:self];
    [appMenu addItem:prefMenu];
    [appMenu addItem:[NSMenuItem separatorItem]]; 

   // Show/Hide Menu
    id hideMenuItem = [[[NSMenuItem alloc] initWithTitle:[@"Hide " stringByAppendingString:appName] 
                                action:@selector(hide:) 
                                keyEquivalent:@"h"] 
                                autorelease];
    [appMenu addItem:hideMenuItem];

    id hideOthersMenuItem = [[[NSMenuItem alloc] initWithTitle:@"Hide Others" 
                                action:@selector(hideOtherApplications:) 
                                keyEquivalent:@"h"] 
                                autorelease];
    [hideOthersMenuItem setKeyEquivalentModifierMask:(NSEventModifierFlagOption | NSEventModifierFlagCommand)];
    [appMenu addItem:hideOthersMenuItem];

    id showMenuItem = [[[NSMenuItem alloc] initWithTitle:@"Show All" 
                                action:@selector(unhideAllApplications:) 
                                keyEquivalent:@""] 
                                autorelease];
    [appMenu addItem:showMenuItem];
    [appMenu addItem:[NSMenuItem separatorItem]];

    // Quit Menu
    id quitMenuItem=[[[NSMenuItem alloc] initWithTitle:@"Quit" 
                              action:@selector(terminate:) 
                              keyEquivalent:@"q"] 
                              autorelease];
    [appMenu addItem:quitMenuItem];
    [appMenuItem setSubmenu:appMenu];

}
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




id createWindow(const char* title, int width, int height, NSWindowStyleMask style) {
    return [[[CocoaWindow alloc] initFormWithTitle:[NSString stringWithUTF8String:title] width: width height: height windowStyle: style] autorelease];
}
