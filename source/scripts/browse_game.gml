execute_program("explorer.exe","/select,"+qt+dsmap(dslist(RECLIST,CURREC),"path")+qt,0)
if (keyboard_check(vk_control)) game_end()
