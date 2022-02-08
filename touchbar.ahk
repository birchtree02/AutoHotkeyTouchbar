#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
WinGetTitle, LastWindow, A

Gui touchbar: New
Gui +HwndGuiHwnd
Gui +AlwaysOnTop
Gui +ToolWindow
; Gui, Add, Text, w1000 vtext

Gui, Add, Button, h50 w50 vD1      greloadsub, Reload

Gui, Add, Button, h50 w50 vD2 x+10 gdiscordsub, Discord
Gui, Add, Button, h50 w50 vD3 x+10 gAHKsub, AHK

Gui, Add, Text,x+1,

Gui, Add, Button, h50 w50 vB1 x+10 gbut1
Gui, Add, Button, h50 w50 vB2 x+10 gbut2
Gui, Add, Button, h50 w50 vB3 x+10 gbut3
Gui, Add, Button, h50 w50 vB4 x+10 gbut4
Gui, Add, Button, h50 w50 vB5 x+10 gbut5
Gui, Add, Button, h50 w50 vB6 x+10 gbut6
Gui, Add, Button, h50 w50 vB7 x+10 gbut7
Gui, Add, Button, h50 w50 vB8 x+10 gbut8
Gui, Add, Button, h50 w50 vB9 x+10 gbut9


Gui touchbar:Show, % "y" A_ScreenHeight - 50


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

but5:
{
    ButtonHandler(5)
}
return

but6:
{
    ButtonHandler(6)
}
return

but7:
{
    ButtonHandler(7)
}
return

but8:
{
    ButtonHandler(8)
}
return

but9:
{
    ButtonHandler(9)
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
b5name :=
b6name :=
b7name :=
b8name :=
b9name :=

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
GuiControl touchbar:, B5, %b5name%
GuiControl touchbar:, B6, %b6name%
GuiControl touchbar:, B7, %b7name%
GuiControl touchbar:, B8, %b8name%
GuiControl touchbar:, B9, %b9name%
return

Refresh:
MouseGetPos,,, WinID
WinGetTitle, ThisWindow, A

If (WinID = GuiHwnd) {
    WinMove, ahk_id %GuiHwnd%, ,, A_ScreenHeight - 90
} Else {
    WinMove, ahk_id %GuiHwnd%, ,, A_ScreenHeight - 50
}

WinActivate, %ThisWindow%

If (ThisWindow = "touchbar.ahk" or ThisWindow = "Task Switching") {

}
Else If ThisWindow != LastWindow
{
    WinGetTitle, LastWindow, A
    submenu := ""
    Goto, RenameButtons
}
return