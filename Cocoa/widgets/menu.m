#import "col.h"

@implementation CocoaMenuItem
  @synthesize menuItemAction;

- (void) click:(id)sender {
    menuItemAction(sender);
}
@end

@implementation CocoaMenu

@synthesize menu;
@synthesize menuAction;


- (void) CreateMenu: (NSString*) Title {
    NSMenuItem *newMenuItem = [[NSMenuItem alloc] initWithTitle:Title action:NULL keyEquivalent:@""];
    
    self.menu = [[NSMenu alloc] initWithTitle:Title];
    [newMenuItem setSubmenu:self.menu];
    [[[NSApplication sharedApplication] mainMenu] addItem: newMenuItem];
}

- (void) AddItem: (NSString*)Title withShortcut: (NSString*)key andCallback: (ACTION) callback {
  CocoaMenuItem *item = [[[CocoaMenuItem alloc] init] autorelease];
  [item setTitle:Title];
  [item setTarget:item];
  [item setKeyEquivalent: key];

  if (callback != NULL) {
    [item setMenuItemAction: callback];
    [item setAction: @selector(click:)];
  }

  [self.menu addItem: item];  
}

- (void)addSeparator {
  [self.menu addItem: [NSMenuItem separatorItem]];
}

- (void) SetAction: (id) widget Callback: (ACTION) func {
	[widget setMenuAction:func];
}

@end


id createMenu(const char * Title) {
	id widget = [CocoaMenu new];
	[widget CreateMenu: NSSTR(Title)];
	return widget;

}

void createMenuItem(id parent, const char *caption, const char *key, ACTION callback) {

  [parent AddItem: NSSTR(caption) withShortcut: NSSTR(key) andCallback: callback];

}
void createMenuSeparator(id parent){
  [parent addSeparator];
}
