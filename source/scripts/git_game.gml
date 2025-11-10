var path;

path=filename_path(dsmap(dslist(RECLIST,CURREC),"path"))

path=string_delete_end(path,1) //remove backslash because git gui is stupid

execute_program_silent_async(GIT+" "+string_replace(GITCMD,"%",qt+path+qt))

if (keyboard_check(vk_control)) game_end()
