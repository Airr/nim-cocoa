# NSStatusBar example

import Cocoa, os, dnsclient, net
from nativesockets import getHostName

proc externalIP(): string
proc getActiveIP(): string
proc getComputerName(): string

proc menuCallback(sender: ID) {.cdecl.} =
    case sender.tag:
        of 1001: echo getComputerName()
        of 1002: echo getActiveIP()
        of 1003: echo externalIP()
        of -1:
            echo "bye."
            Cocoa_Quit(sender)
        else: discard

proc externalIP(): string =
    let client = newDNSClient("resolver1.opendns.com",53)
    let resp = client.sendQuery("myip.opendns.com", A)
    result = "External IP: " & resp.answers[0].toString

proc getActiveIP(): string =
    var ip:string
    var s = newSocket(Domain.AF_INET, SockType.SOCK_DGRAM, Protocol.IPPROTO_UDP)
    s.connect("1.0.0.0",Port(1))
    ip = s.getLocalAddr[0]
    s.close()
    return "IP Address: " & ip

proc getComputerName(): string =
    result = "Computer Name: " & getHostName()

Status_Init()

var menu = newStatusMenu()
var statusBar = newStatusBar(getAppDir() & "/img/icon.png")

newStatusMenuItem(menu, 1001, getComputerName(), menuCallback)
newStatusMenuItem(menu, 1002, getActiveIP(), menuCallback)
newStatusMenuItem(menu, 1003, externalIP(), menuCallback)
menu.separator()
newStatusMenuItem(menu, -1, "Quit", menuCallback)


statusBar.menu = menu

Cocoa_Run(menu)
