exe=get_save_filename("Windows EXE Runtime|*.exe",dsmap(dslist(RECLIST,CURREC),"name")+".exe")
if (exe!="")
    execute_program(GAMEMAKER,qt+dsmap(dslist(RECLIST,CURREC),"path")+qt+" --build "+qt+exe+qt,0)
