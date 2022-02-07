#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

AmongUs(x:=-1) {
    global LastWindow

    If (InStr(LastWindow, "Among Us") > 0) {
        hasRun := true
        If (x=-1) {
            AmongUsRename()
        } ELse {
            AmongUsCallback(x)
        }
    } Else {
        hasRun := false
    }

    return hasRun
}

AmongUsRename() {
    global b1name
    global b2name
    global b3name
    global b4name

    b1name := "lobby"
    b2name := "game"
    b3name := "meeting"
    b4name := "dead"
}

AmongUsCallback(x) {
    If (x=1) {
        AmongUsHelper("lobby")
    } Else If (x=2) {
        AmongUsHelper("game")
    } Else If (x=3) {
        AmongUsHelper("meeting")
    } Else If (x=4) {
        AmongUsHelper("dead")
    }
}

AmongUsHelper(state)
{
    WinActivate, ahk_exe Discord.exe
    Send, {!}%state%`r
    Sleep, 100
    WinActivate, Among Us
}