#import <Cocoa/Cocoa.h>

#import "col.h"

@implementation CocoaTextEdit
    @synthesize widget;
    
- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.widget = [[[NSTextView alloc] initWithFrame:frame] autorelease];
        [[self.widget textContainer] setContainerSize:NSMakeSize(FLT_MAX, FLT_MAX)];
        [[self.widget textContainer] setWidthTracksTextView:NO];
        [self.widget setHorizontallyResizable:YES];
        [self.widget setTextContainerInset:NSMakeSize(2.0,2.0)];
        [self setHasHorizontalScroller: YES];
        [self setHasVerticalScroller: YES];
        [self.widget setFont: [NSFont userFontOfSize:13.0]];
        [self.widget setDelegate:self];
        [self.widget becomeFirstResponder];
//         [self.widget setAutoresizingMask: NSViewWidthSizable | NSViewHeightSizable];
        [self setDocumentView: widget];
    }
	return self;
}

- (BOOL)performKeyEquivalent:(NSEvent *)theEvent
{
    if (([theEvent type] == NSEventTypeKeyDown) && ([theEvent modifierFlags] & NSEventModifierFlagCommand)) {   
        NSResponder * responder = [[self window] firstResponder];
       
        if ((responder != nil) && [responder isKindOfClass:[NSTextView class]]) {       
            NSTextView * textView = (NSTextView *)responder;
            NSRange range = [textView selectedRange];
            bool bHasSelectedTexts = (range.length > 0);
           
            unsigned short keyCode = [theEvent keyCode];               
           
            bool bHandled = false;
           
            //6 Z, 7 X, 8 C, 9 V
            if (keyCode == 6) {
                if ([[textView undoManager] canUndo])
                {
                    [[textView undoManager] undo];
                    bHandled = true;           
                }                   
            }
            else if (keyCode == 7 && bHasSelectedTexts) {
                [textView cut:self];
                bHandled = true;
            }
            else if (keyCode== 8 && bHasSelectedTexts) {
                [textView copy:self];               
                bHandled = true;               
            }
            else if (keyCode == 9) {
                [textView paste:self];
                bHandled = true;               
            }       
           
            if (bHandled)
                return YES;               
        }
    }
   
    return NO;   
}


@end

id createTextEdit(id parent, const char* txt, int l, int t, int w, int h) {
    CocoaTextEdit *widget = [[[CocoaTextEdit alloc] initWithFrame:NSMakeRect( l, t, w, h )] autorelease];
    if (strlen(txt)>0) {
        NSString *str = [NSString stringWithUTF8String:txt];
        [[widget documentView]  setString:str];
    }
        
    [[parent contentView] addSubview:widget];
    return widget;
}

