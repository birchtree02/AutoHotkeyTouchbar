#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
WinGetTitle, LastWindow, A

Gui touchbar: New
Gui +AlwaysOnTop
Gui +ToolWindow
Gui, Add, Button, h50 w50 vD1      gsub1, Restart
Gui, Add, Button, h50 w50 vD2 x+10 gsub2, Discord
Gui, Add, Button, h50 w50 vD3 x+10 gsub3, AHK

Gui, Add, Text,x+1,

Gui, Add, Button, h50 w50 vB1 x+10 gbut1
Gui, Add, Button, h50 w50 vB2 x+10 gbut2
Gui, Add, Button, h50 w50 vB3 x+10 gbut3
Gui, Add, Button, h50 w50 vB4 x+10 gbut4

Gui, Add, Text, vtext

Gui, Show


#Persistent
SetTimer, Refresh, 250

return

sub1:
{
    Reload
}
return

sub2:
{
    if (submenu="Discord") {
        submenu := ""
    } Else {
        submenu := "Discord"
    }
    Goto renameButtons
}
return

sub3:
{
    if (submenu="AHK") {
        submenu := ""
    } Else {
        submenu := "AHK"
    }
    Goto renameButtons
}

but1:
{
    ButtonHandler(1)
}
return

but2:
{
    ButtonHandler(2)
}
return

but3:
{
    ButtonHandler(3)
}
return

but4:
{
    ButtonHandler(4)
}
return


ButtonHandler(x)
{
    global LastWindow
    global submenu

    If (submenu = "Discord") {
        If (x=1) {
            Send, +!1
        } Else If (x=2) {
            Send, +!2
        } Else If (x=3) {
        } Else If (x=4) {
        }
    } Else If (submenu = "AHK") {
        If (x=1) {
            AHKHelper("C:\Users\edwar\Documents\coding\Autohotkey\alwaysOnTop.ahk")
        } Else If (x=2) {
            AHKHelper("C:\Users\edwar\Documents\coding\Autohotkey\pageTurner.ahk")
        }
    }
    Else If (InStr(LastWindow, "Visual Studio Code") > 0) {
        If (InStr(LastWindow, ".py") > 0) {
            MsgBox, %LastWindow%
            If (x=1) {
                Send, !{Tab}
                Send, ^+#p
            }
        }
    } Else If (InStr(LastWindow, "Among Us") > 0) {
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
}

AHKHelper(path)
{
    Run, %path%
}

AmongUsHelper(state)
{
    WinActivate, ahk_exe Discord.exe
    Send, {!}%state%`r
    Sleep, 100
    WinActivate, Among Us
}


renameButtons:
If (submenu = "Discord")
{
    b1name := "toggle`rmute"
    b2name := "toggle`rdeafen"
    b3name := 
    b4name := 
} Else If (submenu = "AHK")
{
    b1name := "AOT"
    b2name := "PT"
    b3name := 
    b4name :=     
}
Else If (InStr(LastWindow, "Code") > 0)
{
    b1name := "run"
    b2name := ""
    b3name := ""
    b4name := ""
} Else If (InStr(LastWindow, "Among Us") > 0) {
    b1name := "lobby"
    b2name := "game"
    b3name := "meeting"
    b4name := "dead"
} Else
{
    b1name := 
    b2name := 
    b3name := 
    b4name := 
}


GuiControl touchbar:, B1, %b1name%
GuiControl touchbar:, B2, %b2name%
GuiControl touchbar:, B3, %b3name%
GuiControl touchbar:, B4, %b4name%
return

Refresh:
WinGetTitle, ThisWindow, A
If (WinActive(ahk_exe AutoHotkey.exe) or ThisWindow = "Task Switching") {

}
Else If ThisWindow != LastWindow
{
    WinGetTitle, LastWindow, A
    submenu = ""
    Goto, RenameButtons
}
return

GuiClose:
Exit