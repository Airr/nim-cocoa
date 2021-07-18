#import <Cocoa/Cocoa.h>

#import "col.h"




@implementation CocoaWindow : NSWindow

  NSMenuItem* item;
  NSMenu* subMenu;

-(id) initFormWithTitle:(NSString*)title width:(NSInteger)width height:(NSInteger)height
{
  self = [super initWithContentRect: NSMakeRect(0, 0, width, height)
                styleMask: (NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable)
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
	   // NSString *appName = [[NSProcessInfo processInfo] processName];

    // NSMenuItem* item;
    // NSMenu *subMenu;
    // NSMenu *servicesMenu;
    // self.menu=[[NSMenu alloc] initWithTitle:@"AMainMenu"];


    // //Create the application menu.
    // item=[[NSMenuItem alloc] initWithTitle:@"Apple" 
    //                          action:NULL 
    //                          keyEquivalent:@""];
    // [self.menu addItem:item];
    // subMenu=[[NSMenu alloc] initWithTitle:@"Apple"];
    // [self.menu setSubmenu:subMenu forItem:item];
    // [item release];

    // // About Menu
    // item=[[[NSMenuItem alloc] initWithTitle:[@"About " stringByAppendingString:appName] 
    //                           action:@selector(orderFrontStandardAboutPanel:) 
    //                           keyEquivalent:@""] 
    //                           autorelease];
    // [subMenu addItem:item];     
    // [subMenu addItem:[NSMenuItem separatorItem]];

    // // Preferences Menu
    // item = [[[NSMenuItem alloc] initWithTitle:@"Preferences…" 
    //                             action:NULL keyEquivalent:@","]
    //                             autorelease];
    // [item setTarget:self];
    // [subMenu addItem:item];
    // [subMenu addItem:[NSMenuItem separatorItem]];

    // // Services Menu
    // // item = [[[NSMenuItem alloc] initWithTitle:@"Services" 
    // //                             action:NULL 
    // //                             keyEquivalent:@""] 
    // //                             autorelease];
    // // servicesMenu = [[[NSMenu alloc] initWithTitle:@"Services"] autorelease];
    // // [item setSubmenu:servicesMenu];
    // // [NSApp setServicesMenu:servicesMenu];
    // // [subMenu addItem:item];
    // // [subMenu addItem:[NSMenuItem separatorItem]];   

    // // Show/Hide Menu
    // item = [[[NSMenuItem alloc] initWithTitle:[@"Hide " stringByAppendingString:appName] 
    //                             action:@selector(hide:) 
    //                             keyEquivalent:@"h"] 
    //                             autorelease];
    // [subMenu addItem:item];
    // item = [[[NSMenuItem alloc] initWithTitle:@"Hide Others" 
    //                             action:@selector(hideOtherApplications:) 
    //                             keyEquivalent:@"h"] 
    //                             autorelease];
    // [item setKeyEquivalentModifierMask:(NSEventModifierFlagOption | NSEventModifierFlagCommand)];
    // [subMenu addItem:item];
    // item = [[[NSMenuItem alloc] initWithTitle:@"Show All" 
    //                             action:@selector(unhideAllApplications:) 
    //                             keyEquivalent:@""] 
    //                             autorelease];
    // [subMenu addItem:item];
    // [subMenu addItem:[NSMenuItem separatorItem]];


    // // Quit Menu
    // item=[[[NSMenuItem alloc] initWithTitle:@"Quit" 
    //                           action:@selector(terminate:) 
    //                           keyEquivalent:@"q"] 
    //                           autorelease];
    // [subMenu addItem:item];
    // [subMenu release];  
    // [NSApp setMenu: self.menu];
    // [self.menu release];
    // [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];

    // [self orderFront: self];
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




id createWindow(const char* title, int width, int height) {
    return [[[CocoaWindow alloc] initFormWithTitle:[NSString stringWithUTF8String:title] width: width height: height] autorelease];
}
