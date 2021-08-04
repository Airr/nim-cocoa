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
  [item setIdentifier: Title];

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

- (id) createFileMenu {
  NSMenuItem *newMenuItem = [[NSMenuItem alloc] initWithTitle:@"File" action:NULL keyEquivalent:@""];

  NSMenu *fileMenu = [[NSMenu alloc] initWithTitle:@"File"];

  id newMenu =[[[NSMenuItem alloc] initWithTitle:@"New" 
                            action:@selector(newDocument:) 
                            keyEquivalent:@"n"] 
                            autorelease];
  [fileMenu addItem:newMenu];

  [newMenuItem setSubmenu: fileMenu];
  [[[NSApplication sharedApplication] mainMenu] addItem: newMenuItem];


}

- (id) createEditMenu {
  NSString *appName = [[NSProcessInfo processInfo] processName];
  NSMenuItem *newMenuItem = [[NSMenuItem alloc] initWithTitle:@"Edit" action:NULL keyEquivalent:@""];

  NSMenu *editMenu = [[NSMenu alloc] initWithTitle:@"Edit"];

  id undoMenu =[[[NSMenuItem alloc] initWithTitle:@"Undo" 
                            action:@selector(undo:) 
                            keyEquivalent:@"z"] 
                            autorelease];
  [editMenu addItem:undoMenu];

  // ;

  id redoMenu =[[[NSMenuItem alloc] initWithTitle:@"Redo" 
                            action:@selector(redo:) 
                            keyEquivalent:@"Z"] 
                            autorelease];
  [editMenu addItem:redoMenu];

  [editMenu addItem: [NSMenuItem separatorItem]];

  id cutMenu =[[[NSMenuItem alloc] initWithTitle:@"Cut" 
                            action:@selector(cut:) 
                            keyEquivalent:@"x"] 
                            autorelease];
  [editMenu addItem:cutMenu];


  id copyMenu =[[[NSMenuItem alloc] initWithTitle:@"Copy" 
                            action:@selector(copy:) 
                            keyEquivalent:@"c"] 
                            autorelease];
  [editMenu addItem:copyMenu];



  id pasteMenu =[[[NSMenuItem alloc] initWithTitle:@"Paste" 
                            action:@selector(paste:) 
                            keyEquivalent:@"v"] 
                            autorelease];
  [editMenu addItem:pasteMenu];

  id pasteAndMatchMenu =[[[NSMenuItem alloc] initWithTitle:@"Paste and Match Style" 
                            action:@selector(pastAsPlainText:) 
                            keyEquivalent:@""] 
                            autorelease];
  [editMenu addItem:pasteAndMatchMenu];

  id selectAllMenu =[[[NSMenuItem alloc] initWithTitle:@"Select All" 
                            action:@selector(selectAll:) 
                            keyEquivalent:@"a"] 
                            autorelease];
  [editMenu addItem:selectAllMenu];

  // [newMenuItem setSubmenu: selectAllMenu];  

  // [editMenu addItem: [NSMenuItem separatorItem]];
  [newMenuItem setSubmenu: editMenu];
  [[[NSApplication sharedApplication] mainMenu] addItem: newMenuItem];
}

- (id) createFormatMenu{

  NSFontManager *fontManager = [NSFontManager sharedFontManager];
  [fontManager setDelegate: self];
  NSMenu *fontMenu = [fontManager fontMenu:YES];
  // [[[NSApplication sharedApplication] mainMenu] addItem: fontManager];

  NSMenuItem *newMenuItem = [[NSMenuItem alloc] initWithTitle:@"Format" action:NULL keyEquivalent:@""];

  NSMenu *blah = [[NSMenu alloc] initWithTitle: @"Format"];
  [newMenuItem setSubmenu: blah];

  [newMenuItem setSubmenu: fontMenu];
  [[[NSApplication sharedApplication] mainMenu] addItem: newMenuItem];
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

id createFileMenu() {
  id widget = [CocoaMenu new];
	[widget createFileMenu];
	return widget;
}

id createFormatMenu() {
  id widget = [CocoaMenu new];
	[widget createFormatMenu];
	return widget;  
}
id createEditMenu() {
  id widget = [CocoaMenu new];
	[widget createEditMenu];
	return widget;
}