#SingleInstance force
DetectHiddenWindows,On
fileinstall,commands.xml,commands.xml,1
OnMessage(5,"setguipos")
fileinstall,scilexer.dll,scilexer.dll,1
ifexist scilexer.dll
{
	FileGetVersion,sciver,scilexer.Dll
	if sciver!=3.2.0.0
	FileDelete,scilexer.dll
}
ifnotexist scilexer.dll
{
	splashtexton,300,50,Downloading SciLexer.dll,Please wait
	urldownloadtofile,http://www.maestrith.com/files/SciLexer.dll,scilexer.dll
}
if !fileexist("commands.xml"){
	splashtexton,300,50,Updating Commands File,Please wait
	urldownloadtofile,http://www.maestrith.com/files/commands.xml,commands.xml
	FileRead,com,commands.xml
	StringReplace,com,com,`n,`r`n,all
	FileDelete,commands.xml
	FileAppend,%com%,commands.xml
}
if xg({commands:"//Version/Date"}).text!=20120919045107
{
	FileDelete,commands.xml
	Reload
}
splashtextoff
Gui()
return
getwinpos(ByRef x,ByRef y,ByRef w,ByRef h,win){
	WinGetPos,x,y,,,ahk_id %win%
	VarSetCapacity(size,16,0),DllCall("user32\GetClientRect","uint",win,"uint",&size),w:=NumGet(size,8),h:=NumGet(size,12)
}
m(f*){
	for a,b in f
	list.=b "`n"
	MsgBox,% list
}
t(f*){
	for a,b in f
	list.=b "`n"
	tooltip,% list
}
#include xml
#include guisize.ahk
#include savepos
#include var
#include maingui
#include scintilla
#include setcolors
#include font
#include menu
#include constants
#include set
#include exit
#include notify
#include update
#include autoopen
#include select
#include explorer
#include jts
#include save
#include getpos
#include open
#include keywords
#include count
#include run
#include new
#include new segment
#include fix indent
#include show_scintilla_codes_in_line
#include check
#include find
#include close
#include full backup
#include find in segment
#include hotkey
#include insert function
#include coderefresh
#include context
#include scintilla lookup
#include settings
#include replace
#include edit replacements
#include hwnd
#include edit colors
#include dlg_font
#include labels
#include Insert Braces at Selection
#include publish
#include applypos
#include export
#include restore
#include remove current segment
#include edit highlight text
#include variables
#include clean position data
#include defaultfonts
#include comment selected
#include remove spaces from selected
#include debug
#include about
#include ftp
#include enter
#include brace
#include upload
#include getallpos
#include navigation
#include back
#include ver
#include shape
#include version
#include showfunctions
#include auto update
#include window
#include paste to ahk
#include replace text
#include ideas
#include posinfo
#include hel
#include end of line
#include import
#include export github
#include move selected line up