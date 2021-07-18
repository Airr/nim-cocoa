#import <Cocoa/Cocoa.h>

#import "col.h"

id createLine(id parent, int x, int y, int width) {
	NSBox *widget = [[[NSBox alloc] initWithFrame:NSMakeRect(x,y,width,1)] autorelease];
	widget.boxType = NSBoxSeparator;
	[[parent contentView] addSubview:widget];
	return widget;
}

// create a horizontally oriented separator

// NSBox *horizontalSeparator=[[NSBox alloc] initWithFrame:NSMakeRect(15.0,250.0,250.0,1.0)];

// [horizontalSeparator setBoxType:NSBoxSeparator];

 

// create a vertically oriented separator

// NSBox *verticalSeparator=[[NSBox alloc] initWithFrame:NSMakeRect(250.0,15.0,1.0,250.0)];

// [verticalSeparator setBoxType:NSBoxSeparator];
