#import <Cocoa/Cocoa.h>

#import "col.h"

void Pin(id widget, NSInteger value) {
	[(NSView*)widget setAutoresizingMask: value]; 
}

void SetText(id widget, const char* txt){
	NSString *widgetClass = [[widget class] description];

	if ([widgetClass isEqualToString:@"CocoaTextEdit"])
	{
		[[widget documentView]  setString: [NSString stringWithUTF8String: txt]];
        [widget setNeedsDisplay: YES];
    }else if ([widgetClass isEqualToString:@"CocoaWindow"]) {
    	[widget setTitle: [NSString stringWithUTF8String: txt]];
	}else{
    	[widget setStringValue:[NSString stringWithUTF8String:txt]];
    }
}

void AddItem(id widget, const char* txt ){
	NSString *widgetClass = [[widget class] description];

	/* ListBox */
	if ([widgetClass isEqualToString:@"CocoaListBox"] || [widgetClass isEqualToString:@"CocoaTableView"])
	{
		[[widget db] addObject: [NSString stringWithUTF8String: txt]];
		[[widget tbl] reloadData];
	}else{
	/* ComboBox */
    	[widget addItemWithObjectValue:[NSString stringWithUTF8String:txt]];
    }
}

const char* GetText(id widget) {
	NSString *widgetClass = [[widget class] description];

	/* ListBox */
	if ([widgetClass isEqualToString:@"CocoaListBox"]) {
		NSInteger row = [[widget tbl] selectedRow];
		// NSString *dbValue = [[widget db]objectAtIndex:row];
		// return strdup([dbValue UTF8String]);
		return [[[widget db]objectAtIndex:row] UTF8String];

	/* TextEdit */
	}else if ([widgetClass isEqualToString:@"CocoaTextEdit"]) {
		if ( [[[widget documentView] string] length] > 0) {
			return [[[widget documentView] string] UTF8String];
		}else{
			return @"".UTF8String;
		}
		// const char* str = [[[widget textStorage] string] UTF8String];
		// if (strlen(str)>0) {
	  	// 	return strdup(str);
		// }else{
	  	// 	return strdup("");
	  	// }
	/* ComboBox */
	}else if ([widgetClass isEqualToString: @"CocoaComboBox"]) {
		return [[widget objectValueOfSelectedItem] UTF8String];

	/* RadioButton, Box */
	}else if ([widgetClass isEqualToString: @"RadioButton"] || [widgetClass isEqualToString: @"NSBox"]) {
		return [[widget title] UTF8String];

	}else{
	/* Everything Else */
		return [[widget stringValue] UTF8String];
	}
}

int GetValue(id widget) {
	NSString *widgetClass = [[widget class] description];

		/* Slider */
	if ([widgetClass isEqualToString: @"CocoaSlider"]) {
		return [widget Value];
	}
	return 0;
}

void SetValue(id widget, int value) {
	NSString *widgetClass = [[widget class] description];

		/* Slider */
	if ([widgetClass isEqualToString: @"CocoaSlider"]) {
		[widget setIntValue:value];
	}	
}

void SetItem(id widget, int pos) {
	NSString *widgetClass = [[widget class] description];
	if ([widgetClass isEqualToString:@"CocoaListbox"]) {
		NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:pos];
		[widget selectRowIndexes: indexSet byExtendingSelection:NO];
	}else if ([widgetClass isEqualToString:@"CocoaComboBox"]) {
		[widget selectItemAtIndex:pos];
		[widget setObjectValue:[widget objectValueOfSelectedItem]];
	}
}

void RemoveItem(id widget, int index) {
	NSString *widgetClass = [[widget class] description];

	if ([widgetClass isEqualToString:@"CocoaListBox"]) {
		[[widget db]removeObjectAtIndex: index];
		[[widget tbl] reloadData];
	}else if ([widgetClass isEqualToString:@"CocoaComboBox"]) {
		[widget removeItemAtIndex: index];
	}	
}

void LB_Clear(id widget) {
	[[widget db] removeAllObjects];
	[[widget tbl] reloadData];
}

void Cocoa_Init() {
    [NSApplication sharedApplication];
	[NSApp setDelegate: [[AppDelegate new] autorelease]];
    [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
}

void Cocoa_Run() {   
    // NSApplicationMain(0,0);
    // [NSApp setDelegate:mainWin];
    [NSApp activateIgnoringOtherApps:YES];
    [NSApp run];
}

void Cocoa_Quit() {
	[NSApp performSelector:@selector(terminate:) withObject:nil afterDelay:0.0];
}

void Cocoa_About() {
	[NSApp performSelector:@selector(orderFrontStandardAboutPanel:) withObject:nil afterDelay:0.0];
}

void Notify(const char *title, const char * subtitle, const char *text) {
	if (strlen(title)>0 && strlen(text)>0) {

        NSUserNotificationCenter *nc = NSUserNotificationCenter.defaultUserNotificationCenter;

        NSUserNotification *note = NSUserNotification.new;
        note.title = [NSString stringWithUTF8String:title];
        note.subtitle = [NSString stringWithUTF8String:subtitle];
        note.informativeText = [NSString stringWithUTF8String:text];
		note.soundName = NSUserNotificationDefaultSoundName;

        [nc deliverNotification:note];

		[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];

	}

}

void addToParent(id parent, id child) {
	NSString *widgetClass = [[parent class] description];
    if ([widgetClass isEqualToString:@"NSTabViewItem"]) {
        [[parent view] addSubview: child];
    } else {
        [[parent contentView] addSubview: child];
    }
}

void setToolTip(id widget, const char *tooltip) {
	[widget setToolTip: [NSString stringWithUTF8String: tooltip]];
}

void eventAction(id widget, EVENT_ACTION callback) {
	[widget setEventAction: callback];
}

void setSystemAction(id widget, const char *Title, const char *actionName) {
	SEL selector = NSSelectorFromString(NSSTR(actionName));
	id menuItem = [widget itemWithTitle: NSSTR(Title)];
	NSLog(@"%d",[menuItem respondsToSelector: selector]);
	if (selector) {
		[menuItem setAction: @selector(selector)];
	}
}

void setDelegate(id widget) {
	[NSApp setDelegate: widget];
}
