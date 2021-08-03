#include <Cocoa/Cocoa.h>

#import "col.h"


char* createSaveDialog(id parent, const char* title, const char* types) {
    NSString* path = @"";
	NSSavePanel *widget = [NSSavePanel savePanel];
	
    if (strlen(title)>0) {
        widget.title = [NSString stringWithUTF8String: title];
    }else{
        widget.title = @"Save File";
    }


   // Set FileTypes
    if ( strlen(types) > 0 ) {
        NSString *fileTypes = [NSString stringWithUTF8String:types];
        NSArray *fTypes = [fileTypes componentsSeparatedByString:@":"];

        [widget setAllowedFileTypes:fTypes];
    } 
    
    widget.showsResizeIndicator = YES;
    widget.showsHiddenFiles = NO;
    widget.canCreateDirectories = YES;
    widget.allowsOtherFileTypes = YES;

            	
    // if ( [widget runModal] == NSModalResponseOK ) {
    //     path = [[widget URL] path];
    // }

    [widget beginSheetModalForWindow:parent completionHandler:^(NSInteger result) {
        [NSApp stopModalWithCode:result];
    }];

    if ([NSApp runModalForWindow:parent] == NSFileHandlingPanelOKButton) {
        NSString* path = [[widget URL] path];
        return strdup([path UTF8String]);
    }
	return strdup([path UTF8String]);

}



