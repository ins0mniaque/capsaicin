#Requires AutoHotkey v2.0
#SingleInstance force
#WinActivateForce
SendMode("Input")

;@Ahk2Exe-SetName Capsaicin
;@Ahk2Exe-SetVersion 1.0.0
;@Ahk2Exe-SetMainIcon capsaicin.ico
;@Ahk2Exe-IgnoreBegin
TraySetIcon("capsaicin.ico")
;@Ahk2Exe-IgnoreEnd

A_IconTip := "Capsaicin"
A_TrayMenu.Delete()
A_TrayMenu.Add("Capsaicin 1.0.0", (*) => { })
A_TrayMenu.Disable("Capsaicin 1.0.0")
A_TrayMenu.Add()
A_TrayMenu.Add("&Help", (*) => Run("https://www.github.com/ins0mniaque/capsaicin"))
A_TrayMenu.Add("E&xit", (*) => ExitApp())

SetCapsLockState("AlwaysOff")

; TODO: Fix msedge switch not excluding apps
GroupAdd "EdgeApp", "Google Calendar ahk_exe msedge.exe"
GroupAdd "EdgeApp", "Gmail ahk_exe msedge.exe"

CapsLock & C::SwitchTo("code", "ahk_exe Code.exe")
CapsLock & J::SwitchTo("devenv", "ahk_exe devenv.exe")
CapsLock & V::SwitchTo("devenv", "ahk_exe devenv.exe")
CapsLock & K::SwitchTo("wt", "ahk_exe WindowsTerminal.exe")
CapsLock & L::SwitchTo("msedge", "ahk_exe msedge.exe", "ahk_group EdgeApp")
CapsLock & P::SwitchTo("msedge --app=https://calendar.google.com", "Google Calendar ahk_exe msedge.exe")
CapsLock & M::SwitchTo("msedge --app=https://mail.google.com", "Gmail ahk_exe msedge.exe")
CapsLock & O::SwitchTo("obsidian", "ahk_exe Obsidian.exe")
CapsLock & S::SwitchTo("slack", "ahk_exe Slack.exe")

RAlt & C::SwitchTo("code", "ahk_exe Code.exe")
RAlt & J::SwitchTo("devenv", "ahk_exe devenv.exe")
RAlt & W::SwitchTo("devenv", "ahk_exe devenv.exe")
RAlt & K::SwitchTo("wt", "ahk_exe WindowsTerminal.exe")
RAlt & L::SwitchTo("msedge", "ahk_exe msedge.exe", "ahk_group EdgeApp")
RAlt & P::SwitchTo("msedge --app=https://calendar.google.com", "Google Calendar ahk_exe msedge.exe")
RAlt & M::SwitchTo("msedge --app=https://mail.google.com", "Gmail ahk_exe msedge.exe")
RAlt & O::SwitchTo("obsidian", "ahk_exe Obsidian.exe")
RAlt & S::SwitchTo("slack", "ahk_exe Slack.exe")

RCtrl & C::SwitchTo("code", "ahk_exe Code.exe")
RCtrl & J::SwitchTo("devenv", "ahk_exe devenv.exe")
RCtrl & W::SwitchTo("devenv", "ahk_exe devenv.exe")
RCtrl & K::SwitchTo("wt", "ahk_exe WindowsTerminal.exe")
RCtrl & L::SwitchTo("msedge", "ahk_exe msedge.exe", "ahk_group EdgeApp")
RCtrl & P::SwitchTo("msedge --app=https://calendar.google.com", "Google Calendar ahk_exe msedge.exe")
RCtrl & M::SwitchTo("msedge --app=https://mail.google.com", "Gmail ahk_exe msedge.exe")
RCtrl & O::SwitchTo("obsidian", "ahk_exe Obsidian.exe")
RCtrl & S::SwitchTo("slack", "ahk_exe Slack.exe")

SwitchTo(app, window, exclude := '')
{
    if WinExist(window)
        WinActivate(window, '', exclude)
    else
        Run app
}