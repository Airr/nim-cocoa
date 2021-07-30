# Imports

* NSFunctions




# Procs

## newButton*

```nim
proc newButton*(parent: ID; caption: cstring; left: cint; top: cint; width: cint; height: cint; `func`: ACTION): ID  {.cdecl, importc: "createButton".}
```

Creates new Button object 

 Example: 


```nim
  btn1 = newButton(mainWindow, "Open", width-100, 20, 90, 24, btnClicked)
```
 

 

 Callback must be in the form: 


```nim
  proc buttonCB(sender: ID) {.cdecl.} =
    <..code...>
```
 




____

