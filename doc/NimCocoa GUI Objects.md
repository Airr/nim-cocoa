# <u>NimCocoa GUI Objects</u>

### <u>newWindow</u>

##### proc newWindow*(title: cstring, width, height: int, style: int): ID

```nim
var mainWin = newWindow("GUI", 800, 600, NSWindowStyleMaskTitled or NSWindowStyleMaskClosable)
```

| Parameter Name  | Parameter Type | Comments                 |
| --------------- | -------------- | ------------------------ |
| title           | cstring        | window title             |
| width           | int            | width of window          |
| height          | int            | height of window         |
| style           | int            | Type and style of window |
| **RETURN TYPE** | ID             | handle new NSWindow      |

##### 

### **<u>newLabel</u>**

##### proc newLabel*(parent: ID; txt: cstring, left, top, width, height: int): ID

```nim
var myLabel = newLabel(mainWin,"This is a label", 20,20,120,24)
```

| Parameter Name  | Parameter Type | Comments              |
| --------------- | -------------- | --------------------- |
| parent          | `ID`           | parent object         |
| txt             | cstring        | label text            |
| left            | cint           | x position on parent            |
| top             | cint           | y position on parent            |
| width           | cint           | width of label        |
| height          | cint           | height of lable       |
| **RETURN TYPE** | ID             | handle to new NSLabel |

### 

### <u>newButton</u>

##### proc newButton*(parent: ID; caption: cstring; left: cint; top: cint; width: cint; height: cint; callback: ACTION): ID

```nim
var btn = newButton(win, "OK", 385, 17, 81, 24, nil)
```

| Parameter Name  | Parameter Type | Comments                                |
| --------------- | -------------- | --------------------------------------- |
| parent          | ID             | parent object                           |
| caption         | cstring        | button text                             |
| left            | cint           | x position on parent                              |
| top             | cint           | y position on parent                              |
| width           | cint           | width of button                         |
| height          | cint           | height of button                        |
| callback        | ACTION         | function to execute when clicked or nil |
| **RETURN TYPE** | ID             | handle to new NSButton                  |

### 

### **<u>newTextField</u>**

##### proc newTextField*(parent: ID; txt: cstring; left: cint; top: cint; width: cint; height: cint): ID

```nim
var myTextEntry = newTextField(mainWin,"", 20,20,320,24)
```

| Parameter Name  | Parameter Type | Comments                        |
| --------------- | -------------- | ------------------------------- |
| parent          | ID             | parent object                   |
| caption         | cstring        | text to display or blank string |
| left            | cint           | x position on parent                      |
| top             | cint           | y position on parent                      |
| width           | cint           | width of textfield              |
| height          | cint           | height of textfield             |
| **RETURN TYPE** | ID             | handle to new NSTextField       |

##### 

### <u>newTextEdit</u>

##### proc newTextEdit*(parent: ID; txt: cstring, left, top, width, height: int): ID

```nim
var editor = newTextEdit(mainWin,"", 20, 40, 500, 500)
```

| Parameter Name  | Parameter Type | Comments                        |
| --------------- | -------------- | ------------------------------- |
| parent          | ID             | parent object                   |
| caption         | cstring        | text to display or blank string |
| left            | cint           | x position on parent                      |
| top             | cint           | y position on parent                      |
| width           | cint           | width of textedit               |
| height          | cint           | height of textedit              |
| **RETURN TYPE** | ID             | handle to new NSTextEdit        |

##### 

## <u>newListbox</u>

##### proc newListBox*(parent: ID, left, top, width, height: cint): ID

```nim
var 
```

| Parameter Name  | Parameter Type | Comments                |
| --------------- | -------------- | ----------------------- |
| parent          | ID             | parent object           |
| left            | cint           | x position on parent              |
| top             | cint           | y position on parent              |
| width           | cint           | width of listbox        |
| height          | cint           | height of listbox       |
| **RETURN TYPE** | ID             | handle to new NSListBox |

##### 

### <u>newLine</u>

##### proc newLine*(parent: ID, left, top, width: cint): ID

```nim
var line = newLine(mainWin, 20, 100, 500)
```

| Parameter Name  | Parameter Type | Comments             |
| --------------- | -------------- | -------------------- |
| parent          | ID             | parent object        |
| left            | cint           | x position on parent           |
| top             | cint           | y position on parent           |
| width           | cint           | width of line        |
| **RETURN TYPE** | ID             | handle to new NSLine |

##### 

### <u>newComboBox</u>

##### proc newComboBox*(parent: ID; left: cint; top: cint; width: cint; height: cint; `callback`: ACTION): ID

```nim
var combo = newComboBox(mainWin, 16,54,210,26, comboCallback)
```

| Parameter Name  | Parameter Type | Comments                                              |
| --------------- | -------------- | ----------------------------------------------------- |
| parent          | ID             | parent object                                         |
| left            | cint           | x position on parent                                            |
| top             | cint           | y position on parent                                            |
| width           | cint           | width of combobox                                     |
| height          | cint           | height of combobox                                    |
| callback        | ACTION         | function to execute when selected item changes or nil |
| **RETURN TYPE** | ID             | handle to new NSComboBox                              |

##### 

### <u>newCheckBox</u>

##### proc newCheckBox*(parent: ID, caption: cstring, left, top, width, height:int): ID

```nim
var chkbox = newCheckBox(mainWin,"Check Box 1", 240, 54, 100, 24)
```

| Parameter Name  | Parameter Type | Comments                 |
| --------------- | -------------- | ------------------------ |
| parent          | ID             | parent object            |
| caption         | cstring        | text to display          |
| left            | cint           | x position on parent               |
| top             | cint           | y position on parent               |
| width           | cint           | width of checkbox        |
| height          | cint           | height of checkbox       |
| **RETURN TYPE** | ID             | handle to new NSCheckBox |

##### 

### <u>newSlider</u>

##### proc newSlider*(parent: ID; left, top, width, height: int, callback: ACTION): ID

```nim
var slide = newSlider(mainWin, 20, 20, 300, 24, [callback_proc or nil])
```

| Parameter Name  | Parameter Type | Comments                                |
| --------------- | -------------- | --------------------------------------- |
| parent          | `ID`           | parent object                           |
| left            | cint           | x position on parent                              |
| top             | cint           | y position on parent                              |
| width           | cint           | width of slider                         |
| height          | cint           | height of slider                        |
| callback        | ACTION         | function to call when slider is updated |
| **RETURN TYPE** | ID             | handle to new NSSlider                  |

### 

### <u>newOpenDialog</u>

##### proc newOpenDialog*(parent: ID, types: cstring): cstring

```nim
var filename = newOpenDialog(mainWin, "nim:c:m")
```

| Parameter Name  | Parameter Type | Comments                                       |
| --------------- | -------------- | ---------------------------------------------- |
| parent          | ID             | parent window objcet                           |
| types           | cstring        | filetype suffixes, separated by ':' (colon)    |
| **RETURN TYPE** | cstring        | full path to file or empty string if cancelled |

##### 

### <u>newSaveDialog</u>

##### proc newSaveDialog*(parent: ID, types: cstring): cstring

```nim
var filename = newSaveDialog(mainWin, "nim:c:m")
```

| Parameter Name  | Parameter Type | Comments                                       |
| --------------- | -------------- | ---------------------------------------------- |
| parent          | ID             | parent window object                           |
| types           | cstring        | filetype suffixes, separated by ':' (colon)    |
| **RETURN TYPE** | cstring        | full path to file or empty string if cancelled |

### 

### <u>newDialog</u>

##### proc newDialog*(title, message: cstring, height: cint): cint

```nim
var retVal = newDialog("Hello", "Greetings from somewhere", 50)
```

| Parameter Name  | Parameter Type | Comments                              |
| --------------- | -------------- | ------------------------------------- |
| parent          | ID             | parent window object                  |
| message         | cstring        | text to display                       |
| height          | cint           | height of dialog                      |
| **RETURN TYPE** | cint           | value of selected button [OK, Cancel] |

##### 

### <u>newMessageBox</u>

##### proc newMessageBox*(title, message: cstring, height: cint): cint

```nim
var retVal = newMessageBo("Info", "Today is Monday", 100)
```

| Parameter Name  | Parameter Type | Comments                        |
| --------------- | -------------- | ------------------------------- |
| parent          | ID             | parent window object            |
| title           | cstring        | title displayed for messagebox  |
| message         | cstring        | message displayed in messagebox |
| height          | cint           | height of messagebox            |
| **RETURN TYPE** | cint           | value of selected button        |

##### 

### <u>newMenu</u>

##### proc newMenu*(title: cstring): ID

```nim
var fileMenu = newMenu(mainWin,"File")
```

| Parameter Name  | Parameter Type | Comments                    |
| --------------- | -------------- | --------------------------- |
| parent          | ID             | parent window object        |
| title           | cstring        | name shown in GUI main menu |
| **RETURN TYPE** | ID             | handle to new NSMenu        |

##### 

### <u>newMenuItem</u>

##### proc newMenuItem*(parent: ID, caption, key: cstring, `callback`:ACTION)

```nim

```

| Parameter Name | Parameter Type | Comments                         |
| -------------- | -------------- | -------------------------------- |
| parent         | ID             | parent MENU object               |
| caption        | cstring        | name shown under parent menu     |
| callback       | ACTION         | function to execute when clicked |

##### 

### <u>newMenuSeparator</u>

##### proc newMenuSeparator*(parent: ID)

```nim

```

| Parameter Name | Parameter Type | Comments           |
| -------------- | -------------- | ------------------ |
| parent         | ID             | parent MENU object |
