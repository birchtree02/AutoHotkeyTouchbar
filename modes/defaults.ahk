#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

discordsub:
{
    if (submenu="DefaultsDiscord") {
        submenu := ""
    } Else {
        submenu := "DefaultsDiscord"
    }
    Goto renameButtons
}
return

AHKsub:
{
    if (submenu="DefaultsAHK") {
        submenu := ""
    } Else {
        submenu := "DefaultsAHK"
    }
    Goto renameButtons
}
return

Defaults(x:=-1) {
    global submenu

    hasRun := false
    If (InStr(submenu, "Defaults") > 0) {
        hasRun := true
        If (x = -1) {
            DefaultsRename()
        }
        Else {
            DefaultsCallback(x)
        }
    }

    return hasRun
}

DefaultsRename() {
    global submenu
    global b1name
    global b2name

    If (submenu = "DefaultsDiscord")
    {
        b1name := "toggle`rmute"
        b2name := "toggle`rdeafen"
    } Else If (submenu = "DefaultsAHK")
    {
        b1name := "AOT"
        b2name := "PT"
    }
}

DefaultsCallback(x) {
    global submenu

    If (submenu = "DefaultsDiscord") {
        If (x=1) {
            Send, +!1
        } Else If (x=2) {
            Send, +!2
        } Else If (x=3) {
        } Else If (x=4) {
        }
    } Else If (submenu = "DefaultsAHK") {
        If (x=1) {
            AHKHelper("C:\Users\edwar\Documents\coding\Autohotkey\alwaysOnTop.ahk")
        } Else If (x=2) {
            AHKHelper("C:\Users\edwar\Documents\coding\Autohotkey\pageTurner.ahk")
        }
    }
}

AHKHelper(path)
{
    Run, %path%
}