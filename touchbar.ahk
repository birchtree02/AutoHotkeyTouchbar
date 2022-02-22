#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
WinGetTitle, LastWindow, A

Gui touchbar: New
Gui +HwndGuiHwnd
Gui +AlwaysOnTop
Gui +ToolWindow

; 'Default buttons' will always show on the left
; The reload button runs code in this file (under the 'reloadsub' label)
; All other default buttons run code in the 'modes\defaults.ahk' file (under their respective labels)
Gui, Add, Button, h50 w50 vD1      greloadsub, Reload
Gui, Add, Button, h50 w50 vD2 x+10 gdiscordsub, Discord
Gui, Add, Button, h50 w50 vD3 x+10 gAHKsub, AHK
; add new default buttons here

; Adds a gap in between 'default' and 'context dependent' buttons
Gui, Add, Text,x+1,

; 'context dependent' buttons show to the right of default buttons
Gui, Add, Button, h50 w50 vB1 x+10 gbut1
Gui, Add, Button, h50 w50 vB2 x+10 gbut2
Gui, Add, Button, h50 w50 vB3 x+10 gbut3
Gui, Add, Button, h50 w50 vB4 x+10 gbut4
Gui, Add, Button, h50 w50 vB5 x+10 gbut5
Gui, Add, Button, h50 w50 vB6 x+10 gbut6
Gui, Add, Button, h50 w50 vB7 x+10 gbut7
Gui, Add, Button, h50 w50 vB8 x+10 gbut8
Gui, Add, Button, h50 w50 vB9 x+10 gbut9
; add new 'context' buttons here (search for 'newctxbtn')


Gui touchbar:Show, % "y" A_ScreenHeight - 50


#Persistent
SetTimer, Refresh, 250

return

; defaults.ahk makes the default buttons function
#Include, modes\defaults.ahk

; the following files make the context buttons function
#Include, modes\vscode.ahk
#Include, modes\amongus.ahk
; add more context files here (search for 'newctxfile', and see 'modes\example.ahk')

reloadsub:
{
    Reload
}
return

; the following labels (but1 to butX) are jumped to whenever a button is pressed
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

; (newctxbtn)
; butX:
; {
;     ButtonHandler(X)
; }
; return

; handles button presses
ButtonHandler(x)
{
    global LastWindow
    If (Defaults(x)) {
    }
    Else If (VSCode(x)) {
    }
    Else If (AmongUs(x)) {
    }
    ; (newctxfile)
    ;Else If (FunctionName(x)) {
    ;}
}

renameButtons:
; clears all buttons before renaming them
b1name :=
b2name :=
b3name :=
b4name :=
b5name :=
b6name :=
b7name :=
b8name :=
b9name :=
; (newctxbtn)

If (Defaults())
{}
Else If (VSCode())
{}
Else If (AmongUs())
{}
; (newctxfile)
; Else If (FunctionName())
; {}


GuiControl touchbar:, B1, %b1name%
GuiControl touchbar:, B2, %b2name%
GuiControl touchbar:, B3, %b3name%
GuiControl touchbar:, B4, %b4name%
GuiControl touchbar:, B5, %b5name%
GuiControl touchbar:, B6, %b6name%
GuiControl touchbar:, B7, %b7name%
GuiControl touchbar:, B8, %b8name%
GuiControl touchbar:, B9, %b9name%
; (newctxbtn)
return

Refresh:
MouseGetPos,,, WinID
WinGetTitle, ThisWindow, A

; if the cursor is over the touchbar, move it up from the bottom of the screen
; otherwise, move it back down
If (WinID = GuiHwnd) {
    WinMove, ahk_id %GuiHwnd%, ,, A_ScreenHeight - 90
} Else {
    WinMove, ahk_id %GuiHwnd%, ,, A_ScreenHeight - 50
}

WinActivate, %ThisWindow%

; checks if the currently active window has changed
; if it has, rename the buttons
If (ThisWindow = "touchbar.ahk" or ThisWindow = "Task Switching") {

}
Else If ThisWindow != LastWindow
{
    WinGetTitle, LastWindow, A
    submenu := ""
    Goto, RenameButtons
}
return