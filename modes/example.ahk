#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; this is the function run from touchbar.ahk whenever the window changes or a button is pressed
; takes an optional argument (x)
; if x is -1, this indicates buttons are to be renamed
; if x is anything other than -1, x indicates the button which has been pressed
Example(x:=-1) {
    global LastWindow

    ; check whether the correct window for this context is open
    If (InStr(LastWindow, "Example") > 0) {
        hasRun := true
        If (x=-1) {
            ExampleRename()
        } ELse {
            ExampleCallback(x)
        }
    } Else {
        hasRun := false
    }

    return hasRun
}

; this function handles the renaming of any buttons you want to use
ExampleRename() {
    ; make however many buttons you wish to use global
    global b1name
    global b2name
    ; ...
    ; global bXname

    b1name := "example1"
    b2name := "example2"
    ; ...
    ; bXname := "exampleX"
}

; this function is run when the specified program is active and a context button is pressed
; takes an argument (x) specifying the button pressed
ExampleCallback(x) {
    If (x=1) {
        ; do stuff here
    } Else If (x=2) {
        ; do other stuff here
    } Else If (x=X) {
        ; do more stuff here
    }
}

; add any helper functions you require here
ExampleHelper()
{
}