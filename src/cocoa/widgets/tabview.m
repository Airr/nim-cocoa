#import <Cocoa/Cocoa.h>

#import "col.h"


id createTabView(id parent, const char *label, int x, int y, int width, int height) {
    NSString *str = [NSString stringWithUTF8String:label];
    NSArray *items = [str componentsSeparatedByString: @"|"];
    
	id *widget = [[[NSTabView alloc] initWithFrame:NSMakeRect(x,y,width,height)] autorelease];
       
    for(NSString *x in items) {
        id sv = [[[SaneView alloc] initWithFrame: NSZeroRect] autorelease];
        [sv setBackgroundColor: [NSColor windowBackgroundColor]];
    
        id *tabwidget = [[[NSTabViewItem alloc] initWithIdentifier: x ] autorelease];
        [tabwidget setLabel: x];
        [tabwidget setView: sv];
        [widget addTabViewItem: tabwidget];
    }

	[[parent contentView] addSubview:widget];
	return widget;
}

void addTab(id parent, const char *name) {
    NSString *str = [NSString stringWithUTF8String:name];
    NSArray *items = [str componentsSeparatedByString: @"|"];

    for(NSString *x in items){
        id *widget = [[[NSTabViewItem alloc] initWithIdentifier: x ] autorelease];
        [widget setLabel: x];
        [parent addTabViewItem: widget];
    }
}

id getTab(id parent, const char *name) {
    NSString *str = [NSString stringWithUTF8String:name];
    NSInteger index = [parent indexOfTabViewItemWithIdentifier: str];
    // NSLog(@"%@", [[parent tabViewItemAtIndex: index] view]);
    return [parent tabViewItemAtIndex: index];
}
