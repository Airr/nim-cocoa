import net,strutils,strtabs


proc getDics*(): StringTableRef =
  var s = newSocket()
  var data: string = ""
  var tab = newStringTable()
  

  s.connect("dict.org", Port(2628))

  s.send("SHOW DB\c\L")
  while true:
    s.readLine(data)
    if data.startsWith("220") or data.startsWith("110"): continue
    if data.startsWith("."): 
      s.send("QUIT\c\L")
      break
    var tmp = data.split("\"")
    tab[tmp[1]] = tmp[0]

  s.close
  return tab


proc getDefinition*(dict,word:string) :string =
  var s = newSocket()
  var data,def: string = ""
  s.connect("dict.org", Port(2628), 500)
  s.send("DEFINE " & dict & " " & word & "\c\L")
  while true:
    s.readLine(data)
    if data.startsWith("552"):
      s.send("QUIT\c\L")
      s.close
      return "No Match For \"" & word & "\"" 

    if data.startsWith("220") or data.startsWith("150"): continue

    if data == ".": data = "\c\L"

    if data.startsWith("250"): 
      s.send("QUIT\c\L")
      break

    def &= data.replace("151 ","") & "\c\L"

  s.close

  return def

