import json, os, plists, times

if paramCount() >= 1:
    let fname = paramStr(1)

    let dt = now()
        
    let appAuthor = "Armando I. Rivera"
    let appName = fname
    let iconFile = "appIcon.icns"
    let bundleIdentifier = "net.binarymagic." & appName
    let appVersion = "0.1"
    let appInfo = appVersion & " Created by " & appAuthor & " on " & dt.format("MM-dd-yyyy")
    let appCopyRight = "Copyright" & dt.format(" yyyy ") & appAuthor & ". All rights reserved."
    let appBundle = appName & ".app"

    if fname.len > 0:
        var pl = %*

            { "CFBundlePackageType" : "APPL",
                "CFBundleInfoDictionaryVersion" : "6.0",
                "CFBundleName" : appName,
                "CFBundleExecutable" : appName,
                "CFBundleIconFile" : iconFile ,
                "CFBundleIdentifier" : bundleIdentifier ,
                "CFBundleVersion" : appVersion ,
                "CFBundleGetInfoString" : appInfo,
                "CFBundleShortVersionString" : appVersion ,
                "NSHumanReadableCopyright" : appCopyRight ,
                "NSPrincipalClass" : "NSApplication" ,
                "NSMainNibFile" : "MainMenu" 
            }


        createDir(appBundle & "/Contents/MacOS")
        createDir(appBundle & "/Contents/Resources")
        createDir(appBundle & "/Contents/Frameworks")

        if appName.fileExists:
            appName.copyFileWithPermissions(appBundle & "/Contents/MacOS/" & appName)

            if iconFile.fileExists:
                iconFile.copyFileWithPermissions(appBundle & "/Contents/Resources/" & iconFile)

            if "Credits.rtf".fileExists:
                "Credits.rtf".copyFileWithPermissions(appBundle & "/Contents/Resources/Credits.rtf")

                
            pl.writePlist(appBundle & "/Contents/Info.plist")

            discard execShellCmd("touch " & appBundle)
            discard execShellCmd("open " & appBundle)
else:
    echo "Usage: bundle <file>"

