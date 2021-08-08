#import <Cocoa/Cocoa.h>

#import "col.h"



int createMessageBox(const char *title, const char *message, int type) {
    NSAlert *alert = [[NSAlert new] autorelease];
     [alert addButtonWithTitle:@"Ok"];
     [alert setMessageText:[NSString stringWithUTF8String:title] ];
     [alert setInformativeText:[NSString stringWithUTF8String:message] ];
     [alert setAlertStyle:NSAlertStyleWarning];
     return [alert runModal];
}
