#import <Cocoa/Cocoa.h>

#import "col.h"


@implementation CocoaListBox

@synthesize tbl;
@synthesize db;

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    db = [NSMutableArray new];

    if (self) {
		tblc = [[NSTableColumn alloc] initWithIdentifier: @"Name"];
		[tblc setEditable: NO];
	
		tbl = [[NSTableView alloc] initWithFrame: NSMakeRect(5,40,335,185)];
		[tbl setGridStyleMask: NSTableViewGridNone];
		[tbl setAllowsColumnSelection: NO];
		[tbl setAllowsColumnReordering: NO];
		[tbl setAllowsEmptySelection: NO];
		[tbl setAllowsMultipleSelection: NO];
		[tbl setColumnAutoresizingStyle: NSTableViewUniformColumnAutoresizingStyle];
		[tbl addTableColumn: tblc];
		[tbl setDataSource: self]; 
		[tbl setDelegate: self];
		[tbl setTarget:self];
		[tbl setDoubleAction:@selector(doubleclicked:)];
		// [tbl setAction:@selector(selected:)];
	
		[tbl setHeaderView:nil];
	
		[self setHasHorizontalScroller: NO];
		[self setHasVerticalScroller: YES];
		[self setDocumentView: tbl];
	//	[self setAutoresizingMask: NSViewWidthSizable | NSViewHeightSizable];
	
		[tblc setResizingMask: NSTableColumnAutoresizingMask];
		[tblc setWidth:10000];
		[tbl reloadData];
	
		cnt = 0;
	}
	return self;
}

- (void)doubleclicked:(id)sender
{
        // int rowIndex = [sender selectedRow];
}

- (void)selected:(id)sender
{
	// [tbl selectRowIndexes:[NSIndexSet indexSetWithIndex:item->row] byExtendingSelection:NO];
}

-(void)tableViewSelectionDidChange:(NSNotification *)notification
{
    NSInteger row = [tbl selectedRow];
    
}

- (long)numberOfRowsInTableView:(NSTableView *)aTableView
{
        return db.count;
}

-(id)tableView:(NSTableView *)tableView
        					  	objectValueForTableColumn:(NSTableColumn *)tableColumn
        						row:(NSInteger)row
{
	return self.db[row];
}


@end


id createListBox(id parent,int l, int t, int w, int h){
    id self = [[[CocoaListBox alloc] initWithFrame:NSMakeRect( l, t, w, h )] autorelease];
    addToParent(parent, self);
    return self;
}
