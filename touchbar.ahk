#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
WinGetTitle, LastWindow, A

Gui touchbar: New
Gui +AlwaysOnTop
Gui +ToolWindow
Gui, Add, Text, vtext

Gui, Add, Button, h50 w50 vD1      greloadsub, Reload

Gui, Add, Button, h50 w50 vD2 x+10 gdiscordsub, Discord
Gui, Add, Button, h50 w50 vD3 x+10 gAHKsub, AHK

Gui, Add, Text,x+1,

Gui, Add, Button, h50 w50 vB1 x+10 gbut1
Gui, Add, Button, h50 w50 vB2 x+10 gbut2
Gui, Add, Button, h50 w50 vB3 x+10 gbut3
Gui, Add, Button, h50 w50 vB4 x+10 gbut4


Gui, Show


#Persistent
SetTimer, Refresh, 250

return

#Include, modes\defaults.ahk

#Include, modes\vscode.ahk
#Include, modes\amongus.ahk

reloadsub:
{
    Reload
}
return

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
    If (Defaults(x)) {
    }
    Else If (VSCode(x)) {
    }
    Else If (AmongUs(x)) {
    }
}

renameButtons:
b1name :=
b2name :=
b3name :=
b4name :=

If (Defaults())
{}
Else If (VSCode())
{}
Else If (AmongUs())
{}


GuiControl touchbar:, B1, %b1name%
GuiControl touchbar:, B2, %b2name%
GuiControl touchbar:, B3, %b3name%
GuiControl touchbar:, B4, %b4name%
return

Refresh:
WinGetTitle, ThisWindow, A
If (ThisWindow = "touchbar.ahk" or ThisWindow = "Task Switching") {

}
Else If ThisWindow != LastWindow
{
    WinGetTitle, LastWindow, A
    submenu := ""
    Goto, RenameButtons
}
return