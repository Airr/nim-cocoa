#import <Cocoa/Cocoa.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <mach-o/getsect.h>
#import  <mach-o/ldsyms.h>
#include <stdio.h>

typedef void(*ACTION)(id);

// SUBCLASSED NSMENUITEM ENABLING C-STYLE CALLBACKS
@interface StatusMenuItem: NSMenuItem{
    ACTION menuAction;
}
    @property ACTION menuAction;
    

    - (void) click:(id)sender;
@end

@implementation StatusMenuItem

	@synthesize menuAction;


	- (void) click:(id)sender {
		menuAction(sender);
	}
@end
NSData *getResource(NSString *sectionName, NSString *itemName) {
    unsigned long size;
    void *ptr = getsectiondata(&_mh_execute_header, sectionName.UTF8String, itemName.UTF8String, &size);
    NSData *resourceData = [NSData dataWithBytesNoCopy:ptr length:size freeWhenDone:NO];
    return resourceData;
}

id createStatusBar(const char *resource) {

    NSString *tmpStr = [NSString stringWithUTF8String: resource];

	NSStatusItem *self;
  	NSStatusBar *statusBar = [NSStatusBar systemStatusBar];
  	self = [statusBar statusItemWithLength:NSSquareStatusItemLength];

  	NSImage *icon = [[NSImage alloc] initWithContentsOfFile: tmpStr];
  	icon.template = YES;
 
  	self.button.image = icon;
  	return self;
}

void setMenu(id parent, id menu) {
//   ((NSStatusItem *)parent).menu = menu;
    [(NSStatusItem *)parent setMenu: menu];
}

// FUNCTION TO CREATE MENU ITEMS/ENTRIES
void createStatusItem(id parent, int tag, const char *title, ACTION func) {
	StatusMenuItem *self = [StatusMenuItem new];
	self.title = [NSString stringWithUTF8String: title];
	self.target = self;
	if (func)
	{
		self.menuAction = func;
		self.action = @selector(click:);

	}

    if (tag) {self.tag = tag;}

	[parent addItem: self];

	// return self;
}

// FUNCTION THAT RETURNS A MENU OBJECT
NSMenu *createStatusMenu() {
	return NSMenu.new;
}

void setTag(id widget, int number) {
  ((NSMenuItem*)widget).tag = number;
}

int tag(id widget) {
  return ((NSMenuItem*)widget).tag;
}

// FUNCTION TO ADD A SEPARATOR TO A MENU
void addSeparator(id parent) {
  [parent addItem: [NSMenuItem separatorItem]];
}

void Status_Init() {
    [NSApplication sharedApplication];
    [NSApp setActivationPolicy:NSApplicationActivationPolicyAccessory];
}

// FUNCTION THAT PASSES CONTROL TO COCOA SUBSYSTEM
void Status_Run(id obj) {
    [NSApp setDelegate: obj]; 
    [NSApp run];    
}

