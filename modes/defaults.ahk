#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

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
}

DefaultsCallback(x) {
    global submenu
}