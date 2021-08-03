#import <Cocoa/Cocoa.h>

#ifdef __cplusplus
	extern "C" {
#endif

    typedef  void* id;
    #define NSSTR(txt) [NSString stringWithUTF8String:txt]
    #define BeginMenu dispatch_async(dispatch_get_main_queue(), ^{
    #define EndMenu });
    

	#ifndef NSWindowStyleMaskTitled
		#define NSWindowStyleMaskTitled NSTitledWindowMask
	#endif
	
	#ifndef NSWindowStyleMaskClosable
		#define NSWindowStyleMaskClosable NSClosableWindowMask
	#endif
	
	#ifndef NSWindowStyleMaskMiniaturizable
		#define NSWindowStyleMaskMiniaturizable NSMiniaturizableWindowMask
	#endif
	
	#ifndef NSWindowStyleMaskResizable
		#define NSWindowStyleMaskResizable NSResizableWindowMask
	#endif
	
	#ifndef NSAlertStyleWarning
		#define NSAlertStyleWarning NSWarningAlertStyle
	#endif	
	
	#ifndef NSTextAlignmentLeft
		#define NSTextAlignmentLeft NSLeftTextAlignment
	#endif
	
	#ifndef NSAlertStyleWarning
		#define NSAlertStyleWarning NSWarningAlertStyle
	#endif
	
	#ifndef NSEventTypeKeyDown
		#define NSEventTypeKeyDown NSKeyDown
	#endif

	#ifndef NSEventModifierFlagCommand
		#define NSEventModifierFlagCommand NSCommandKeyMask
	#endif	
	
	#ifndef NSEventModifierFlagOption
		#define NSEventModifierFlagOption NSAlternateKeyMask
	#endif
	


    typedef void(*ACTION)(id);
   /**
        Used by Internal Callback System
        to route callback to user provided
        subroutine

        Subroutine must not return value

        Ex:
            void Example(void);
    */

    typedef void(*EVENT_ACTION)(id, const char*);

    enum {
        akNone,
        akRight,
        akWidth,
        akLeft = 4,
        akBottom = 8,
        akHeight = 16,
        akFull = 18,
        akTop = 32
        
    };
    /**
       Flags for Widget Anchor System

       akNone       No Anchor
       akRight      Anchor to Right of Window
       akWidth      Anchor to Left and Right (width)
       akLeft       Anchor to Left
       akBottom     Anchor to Bottom
       akHeight     Anchor to Top and Bottom
       akTop        Anchor to Top
    */

    @interface SaneView : NSClipView
    - (BOOL)isFlipped;
    @end

    @interface CocoaWindow : NSWindow <NSApplicationDelegate,NSUserNotificationCenterDelegate,NSWindowDelegate, NSTextFieldDelegate>
    {
        // NOT USED
    }

    - (void)applicationDidFinishLaunching: (NSNotification *)notification;
    - (BOOL)applicationShouldTerminateAfterLastWindowClosed: (NSNotification *)notification;
    - (id) initFormWithTitle:(NSString*)title width:(NSInteger)width height:(NSInteger)height windowStyle: (NSWindowStyleMask) style;
    - (void)createApplicationMenu;
    @end

    @interface awColorPanel: NSColorPanel {
        NSColor* theColor;
        NSModalSession modalSession;
    }
        @property (copy) NSColor* theColor; 

        - (void)colorUpdate:(NSColorPanel*)colorPanel;

        -(void)changeColor:(id)sender;

        - (const char *) hexColor;
    @end
 
    @interface CocoaListBox : NSScrollView <NSTableViewDataSource, NSTableViewDelegate>
    {    
        NSTableView *tbl;
        NSTableColumn *tblc;
        NSMutableArray *db;

        
        int cnt;
    }
        @property (retain) NSTableView *tbl;
        @property (retain) NSMutableArray *db;


    - (id)initWithFrame:(NSRect)frame;
    - (void)doubleclicked:(id)sender;
    - (void)selected:(id)sender;
    @end

    @interface CocoaTableView : NSScrollView <NSTableViewDataSource, NSTableViewDelegate>
    {    
        NSTableView *tbl;
        NSTableColumn *tblc;
        NSTableColumn *tbld;
        NSMutableArray *db;
        NSMutableDictionary *dict;

        
        int cnt;
    }
        @property (retain) NSTableView *tbl;
        @property (retain) NSMutableArray *db;
        @property (retain) NSMutableDictionary *dict;


        - (id)initWithFrame:(NSRect)frame;
        - (void)doubleclicked:(id)sender;
        - (void)selected:(id)sender;
    @end

    @interface CocoaButton: NSButton{
        ACTION buttonAction;
        EVENT_ACTION eventAction;
    }
        @property ACTION buttonAction;
        @property EVENT_ACTION eventAction;
        

        - (void) click:(id)sender;
        - (void)mouseEntered:(NSEvent *)theEvent;
        - (void)mouseExited:(NSEvent *)theEvent;
    @end

    @interface RadioButton: NSButton{
        ACTION buttonAction;
    }
        @property ACTION buttonAction;
        

        - (void) click:(id)sender;
    @end 
    @interface CocoaComboBox : NSComboBox {
        // NSInteger currentItem;
        ACTION comboCallBack;
    }

    @property ACTION comboCallBack;
    @property NSInteger currentItem;

    - (id)initWithFrame:(NSRect)frame;

    /* notification responders */
    - (void)comboBoxSelectionDidChange:(NSNotification *)notification;

    @end

    @interface CocoaTextEdit : NSScrollView <NSTextViewDelegate,NSMenuDelegate>
    {
        NSTextView *widget;
    }
        @property (retain) NSTextView *widget;
        - (id)initWithFrame:(NSRect)frame;
    @end

    @interface CocoaMenu : NSMenu <NSMenuDelegate>
    {
        ACTION menuAction;
    }

    @property (retain) NSMenu *menu;
    @property ACTION menuAction;


    - (void) CreateMenu: (NSString*) Title;
    - (void) AddItem: (NSString*)Title withShortcut: (NSString*)key andCallback: (ACTION) callback;
    // - (void) click:(id)sender;
    - (void) SetAction: (id) widget Callback: (ACTION) func;
    - (void)addSeparator;
    //- (void) click:(id)sender;

    @end

    @interface CocoaMenuItem : NSMenuItem 
    {
        ACTION menuItemAction;
    }
    @property ACTION menuItemAction;

    - (void) click:(id)sender;
    @end

    @interface CocoaSlider: NSSlider
    {
        int Value;
        ACTION sliderAction;
    }
    @property int Value;
    @property ACTION sliderAction;

    - (IBAction)onChanged:(id)sender;
    - (id) initWithFrame:(NSRect)rect callBack:(ACTION)func;
@end

    id createWindow(const char* title, int width, int height, NSWindowStyleMask style);
    /**
        \brief Creates Main Window

        parameters:
                    String:     Title of Window,
                    INT:        Width of Window,
                    INT:        Height of Window

        Returns:
                    Pointer:    Created Window
    */

     void Pin(id widget, NSInteger value);
   /**
        \brief Specifies how child widget responds to resize of Parent

        parameters:
                    Pointer:    Widget
                    INT:        Anchor point (see Enum above)

        Returns:
                    None
    */

     void Cocoa_Init();
   /**
        \brief Initializes Cocoa GUI

        parameters:
                    None

        Returns:
                    None
    */    

     void Cocoa_Run();
   /**
        \brief Passes control over to Cocoa Runtime

        parameters:
                    None

        Returns:
                    None
    */

     void Cocoa_Quit();
   /**
        \brief Terminates Cocoa Runtime

        parameters:
                    None

        Returns:
                    None
    */

    void Cocoa_About();
    /**
        \brief Displays Cocoa About Dialog

        parameters:
                    None

        Returns:
                    None

        Note:
                    Utilizes information contained in Application Bundle's Info.plist
    */

    void SetText(id widget, const char* txt);
    /**
        \brief Sets Widget Text

        parameters:
                    Pointer:    Target Widget
                    Text to set

        Returns:
                    None
    */    

    const char* GetText(id widget);
    /**
        \brief Retrives Text from Widget

        parameters:
                    Pointer:    Target Widget

        Returns:
                    String:     from Widget
    */

    int GetValue(id widget);
    /**
        \brief Retrieves INT value from Widget
        parameters:
                    Pointer:    Target Widget

        Returns:
                    integer:    from Widget
    */

    void SetValue(id widget, int value);
     /**
        \brief Sets INT value for Widget
        parameters:
                    Pointer:    Target Widget
                    INT:        Value to set

    */   

    void AddItem(id widget, const char* txt );
    /**
        \brief Adds TEXT Item to ComboBox/ListBox

        parameters:
                    Pointer:    Target Widget
                    String:     Text to Add

        Returns:
                    None
    */

    // char* GetItem(id widget);
    /**
        \brief Retrieves Selected Text from ComboBox/ListBox

        parameters:
                    Pointer:    Target Widget

        Returns:
                    String:     Text of Selected Item
    */

     id createTextField(id parent,const char* txt,int l, int t, int w, int h);
   /**
        \brief Creates TextField (TextBox/TextEntry) Widget

        parameters:
                    Pointer:    Parent Widget,
                    String:     Default Text to Display,
                    INT:        Left Position in Parent,
                    INT:        Top Position in Parent,
                    INT:        Width of Widget,
                    INT:        Height of Widget

        Returns:
                    Pointer:    Created TextField
    */

    id createComboBox(id parent,int l, int t, int w, int h, ACTION callback);
    /**
        \brief Creates ComboBox Widget

        parameters:
                    Pointer:    Parent Widget,
                    INT:        Left Position in Parent,
                    INT:        Top Position in Parent,
                    INT:        Width of Widget,
                    INT:        Height of Widget,
                    ACTION:     Callback Function or NULL

        Returns:
                    Pointer:    Created ComboBox
    */

    id createButton(id parent, const char* caption, int l, int t, int w, int h, ACTION func);
    /**
        \brief Creates Button Widget

        parameters:
                    Pointer:    Parent Widget,
                    String:     Button Caption,
                    INT:        Left Position in Parent,
                    INT:        Top Position in Parent,
                    INT:        Width of Widget,
                    INT:        Height of Widget,
                    ACTION:     Callback Function or NULL

        Returns:
                    Pointer to Created Button
    */

    void SetAction(id widget, SEL func);

    id createCheckBox(id parent, const char* caption, int l, int t, int w, int h);
    /**
        \brief Creates CheckBox Widget

        parameters:
                    Pointer:    Parent Widget,
                    String:     CheckBox Caption,
                    INT:        Left Position in Parent,
                    INT:        Top Position in Parent,
                    INT:        Width of Widget,
                    INT:        Height of Widget,
                    ACTION:     Callback Function or NULL

        Returns:
                    Pointer to Created TextField
    */

    void SetState(id widget, bool state);
    /**
        \brief Sets State of CheckBox Widget (Checked/Unchecked)

        parameters:
                    Pointer:    Parent Widget,
                    BOOL:       State (True for on, False for off)

        Returns:
                    None
    */

    int State(id widget);
    /**
        \brief Retrieves State of Checkbox (On[True], Off[False])

        parameters:
                    Pointer:    Checkbox Widget,

        Returns:
                    BOOL:       State [True/False]
    */

    id createRadioButton(id parent, const char* caption, int l, int t, int w, int h, ACTION func);
     /**
        \brief Creates RadioButton Widget

        parameters:
                    Pointer:    Parent Widget,
                    String:     Button Caption,
                    INT:        Left Position in Parent,
                    INT:        Top Position in Parent,
                    INT:        Width of Widget,
                    INT:        Height of Widget,
                    ACTION:     Callback Function or NULL

        Returns:
                    Pointer to Created RadioButton
    */
   
    id createListBox(id parent,int l, int t, int w, int h);
    /**
        \brief Creates ListBox Widget

        parameters:
                    Pointer:    Parent Widget,
                    INT:        Left Position in Parent,
                    INT:        Top Position in Parent,
                    INT:        Width of Widget,
                    INT:        Height of Widget

        Returns:
                    Pointer:    Created ListBox Widget
    */

    void LB_Clear(id widget);
    void SetItem(id widget, int pos);
    void RemoveItem(id widget, int pos);


    char* createOpenDialog( id parent, const char *types);
    /**
        \brief Displays OpenFile Dialog Widget

        parameters:
                    Pointer:    Parent Widget,
                    String:     File Types Filter, separated by ":"

        Returns:
                    String:    Path to Selected File, or Blank String

        Example:
                    char *fName = OpenDialog(mywin,"txt:c:h");
    */

     char* createSaveDialog(id parent, const char* title, const char *types);
    /**
        \brief Displays SaveFile Dialog Widget

        parameters:
                    Pointer:    Parent Widget,
                    String:     Dialog Title,
                    String:     File Types Filter, separated by ":"

        Returns:
                    String:    Path to Selected File, or Blank String

        Example:
                    char *fName = SaveDialog(mywin,"txt:c:h");
    */

    int createDialog(const char *title, const char *message, int type);
    int createMessageBox(const char *title, const char *message, int type);
    /**
        \brief Displays MessageBox Dialog Widget

        parameters:
                    String:     Dialog Title,
                    String:     Message to Display,
                    INT:        Type of Dialog(?)

        Returns:
                    INT:        Value corresponding to OK or Cancel

        Example:
                    char *fName = SaveDialog(mywin,"txt:c:h");
    */

    id createColorDialog();
    id getColor(id panel);
    void setColor(id target, id source);

    const char* hexColor(id cPanel);
 
    id createLabel(id parent, const char* txt, int l, int t, int w, int h);
    /**
        \brief Creates Label Widget

        parameters:
                    Pointer:    Parent Widget,
                    String:     Caption of Label,
                    INT:        Left Position in Parent,
                    INT:        Top Position in Parent,
                    INT:        Width of Widget,
                    INT:        Height of Widget

        Returns:
                    Pointer:    Label Widget
    */   
 
    id createTextEdit(id parent, const char* txt, int l, int t, int w, int h);
    /**
        \brief Creates TextEdit Widget

        parameters:
                    Pointer:    Parent Widget,
                    String:     Default Text,
                    INT:        Left Position in Parent,
                    INT:        Top Position in Parent,
                    INT:        Width of Widget,
                    INT:        Height of Widget

        Returns:
                    Pointer:    Label Widget
    */    

    void Notify(const char *title, const char * subtitle, const char *text);
    /**
        \brief Sends Notification to macOS Notification System

        parameters:
                    String:     Title of Notification,
                    String:     Subtitle of Notification,
                    String:     Message to Display

        Returns:
                    None
    */ 

    id createLine(id parent, int x, int y, int width);

    id createMenu(const char * Title);
    void createMenuItem(id parent, const char *caption, const char *key, ACTION callback);
    void createMenuSeparator(id parent);

    id createSlider(id parent, int left, int top, int width, int height, ACTION callback);

    void addToParent(id parent, id child);

    id createBox(id parent, const char* title, int x, int y, int width, int height);

    id createRadioButton(id parent, const char* caption, int l, int t, int w, int h, ACTION func);

    id createTabView(id parent, const char *label, int x, int y, int width, int height);
    void addTab(id parent, const char *name);
    id getTab(id parent, const char *name);

    void eventAction(id widget, EVENT_ACTION callback);
    
#ifdef __cplusplus
	}
#endif

// #endif
