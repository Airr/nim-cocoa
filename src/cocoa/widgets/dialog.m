#import <Cocoa/Cocoa.h>

#include "col.h"


int createDialog(const char *title, const char *message, int type) {
    NSAlert *alert = [[NSAlert new] autorelease];
     [alert addButtonWithTitle:@"Continue"];
     [alert addButtonWithTitle:@"Cancel"];
     [alert setMessageText:[NSString stringWithUTF8String:title] ];
     [alert setInformativeText:[NSString stringWithUTF8String:message] ];
     [alert setAlertStyle:NSAlertStyleWarning];
     return [alert runModal];
}

