#import <Cocoa/Cocoa.h>

#import "col.h"

#ifndef NSSTR
	#define NSSTR(txt) [NSString stringWithUTF8String:txt]
#endif



@implementation CocoaTableView

@synthesize tbl;
@synthesize db;
@synthesize dict;

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    db = [NSMutableArray new];
	dict = [NSMutableDictionary new];

    if (self) {

		tbl = [[NSTableView alloc] initWithFrame: NSMakeRect(5,40,335,185)];
		[tbl setGridStyleMask: NSTableViewGridNone];
		[tbl setAllowsColumnSelection: YES];
		[tbl setAllowsColumnReordering: YES];
		[tbl setAllowsEmptySelection: NO];
		[tbl setAllowsMultipleSelection: NO];
		[tbl setColumnAutoresizingStyle: NSTableViewUniformColumnAutoresizingStyle];

		[tbl setDataSource: self]; 
		[tbl setDelegate: self];
		[tbl setTarget:self];
		[tbl setDoubleAction:@selector(doubleclicked:)];
	
		[self setHasHorizontalScroller: YES];
		[self setHasVerticalScroller: YES];
		[self setDocumentView: tbl];
		[self setAutoresizingMask: NSViewWidthSizable | NSViewHeightSizable];
	

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
		// return dict.count;
}

-(id)tableView:(NSTableView *)tableView
        					  	objectValueForTableColumn:(NSTableColumn *)tableColumn
        						row:(NSInteger)row
{
	// NSString *columnIdentifier = [tableColumn identifier];
	
	return [self.db[row] valueForKey: [tableColumn identifier]];
	// return [self.dict valueForKey: [tableColumn identifier]];

}


@end


id createTableView(id parent,int l, int t, int w, int h){
    id self = [[[CocoaTableView alloc] initWithFrame:NSMakeRect( l, t, w, h )] autorelease];
    addToParent(parent, self);
    return self;
}

void addRow(id parent, const char *person) {
	NSArray *tmpArray = [NSSTR(person) componentsSeparatedByString: @"|"];
	NSMutableDictionary *myDic = [NSMutableDictionary new];
	NSArray *columns = [[parent tbl] tableColumns];

	for (int i = 0; i < tmpArray.count; i++) {
		NSString *ident = [[parent tbl] tableColumns][i].identifier;
		[myDic setObject: tmpArray[i] forKey: ident];
	}

	[[parent db] addObject: myDic];

	[[parent tbl] reloadData];
}

void newTableColumn(id parent, const char *name) {
	NSString *title = [NSString stringWithUTF8String: name];
	id tCol = [[NSTableColumn alloc] initWithIdentifier: [title lowercaseString]];
	[tCol setMinWidth: 200];
	[tCol setTitle: title];

	[[parent tbl] addTableColumn: tCol];
}