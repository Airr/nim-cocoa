#import <Cocoa/Cocoa.h>

#import "col.h"


char* createOpenDialog( id parent, const char *types) {
    NSOpenPanel* widget = [NSOpenPanel openPanel];

    // Enable the selection of files in the dialog.
    [widget setCanChooseFiles:YES];

    widget.showsResizeIndicator = YES;
    widget.showsHiddenFiles = NO;
    widget.canCreateDirectories = YES;

    // Change "Open" dialog button to "Select"
    [widget setPrompt:@"Select"];

    // Set FileTypes
    if ( strlen(types) > 0 ) {
        NSString *fileTypes = [NSString stringWithUTF8String:types];
        NSArray *fTypes = [fileTypes componentsSeparatedByString:@":"];

        [widget setAllowedFileTypes:fTypes];
    } 

    // if ( [widget runModal] == NSModalResponseOK ) {
    //     NSString* path = [[widget URL] path];
    //     return strdup([path UTF8String]);
    // }
    [widget beginSheetModalForWindow:parent completionHandler:^(NSInteger result) {
        [NSApp stopModalWithCode:result];
    }];
    if ([NSApp runModalForWindow:parent] == NSFileHandlingPanelOKButton) {
        NSString* path = [[widget URL] path];
        return strdup([path UTF8String]);
    }

    return strdup("");
}



