#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

VSCode(x:=-1) { ;
    global LastWindow

    If (InStr(LastWindow, "Visual Studio Code") > 0) { ;
        hasRun := true
        If (x=-1) {
            VSCodeRename() ;
        } ELse {
            VSCodeCallback(x) ;
        }
    } Else {
        hasRun := false
    }

    return hasRun
}

VSCodeRename() { ;
    global b1name
    global b2name
    global b3name
    global b4name

    b1name := "run" ;
}

VSCodeCallback(x) { ;
    MsgBox, hi
    If (InStr(LastWindow, ".py") > 0) {
        If (x=1) {
            Send, !{Tab}
            Send, ^+#p
        }
    }

}