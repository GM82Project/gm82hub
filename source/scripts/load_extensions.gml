EXTDIR=directory_appdata+"Roaming\GameMaker8.2\extensions\"

for (file=file_find_first(EXTDIR+"*.dat",0);file!="";file=file_find_next()) {
    if (string_pos("Game Maker 8.2",file)) ds_list_add(EXTLIST,filename_change_ext(filename_name(file),""))
} file_find_close()
