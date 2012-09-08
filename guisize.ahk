GuiSize(width="",height=""){
	static
	GuiSize:
	pos:=var("pos")
	if !A_GuiHeight
	return
	wid:=A_GuiWidth?A_GuiWidth:wid,hei:=A_GuiHeight?A_GuiHeight:hei
	wid:=width?width:wid,hei:=height?height:hei
	var({guiwidth:wid}),var({guiheight:hei})
	WinGetPos,x,y,w,h,% hwnd("h2")
	WinGetPos,x2,y2,w2,h2,% hwnd("h3")
	WinGet,style1,style,% hwnd("h2")
	WinGet,style2,style,% hwnd("h3")
	sub:=(style1&0x10000000)?w:0,sub+=(style2&0x10000000)?w2:0,subx:=(style1&0x10000000)?w:0
	if sub
	ControlMove,,pos.border,% pos.ymin+pos.menu,,hei-pos.status,% hwnd("h2")
	ControlMove,,% wid-w2+pos.border,% pos.ymin+pos.menu,,hei-pos.status,% hwnd("h3")
	ControlMove,Scintilla1,% subx+pos.Border,% pos.ymin+pos.menu,% wid-sub,hei-pos.status,% hwnd("h1")
	return
	2GuiClose:
	3GuiClose:
	WinHide,% hwnd("h" A_Gui)
	getwinpos(x,y,w,h,hwnd(1))
	GuiSize(w,h)
	return
	GuiClose:
	savepos()
	save()
	ExitApp
	return
}
GuiSize23(){
	3guisize:
	2guisize:
	ControlMove,SysTreeView321,,,%A_GuiWidth%,%A_GuiHeight%,% hwnd("h" a_gui)
	if var("moving")
	return
	pos:=var("pos")
	WinGet,style1,style,% hwnd("h2")
	WinGet,style2,style,% hwnd("h3")
	getwinpos(x2,y2,w2,h2,hwnd(2))
	getwinpos(x3,y3,w3,h3,hwnd(3))
	subx:=sub:=(style1&0x10000000)?w2+pos.Border+pos.Border:0
	sub+=(style2&0x10000000)?w3+pos.Border+pos.border:0
	ControlMove,Scintilla1,% subx+pos.border,,% var("guiwidth")-sub,hei-pos.status,% hwnd("h1")
	return
}