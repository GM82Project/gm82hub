draw_rect(0,0,WIDTH,HEIGHT,0,0.5)

cx=WIDTH div 2
cy=HEIGHT div 2

draw_button_ext(cx-200,cy-50,400,100,1,global.col_main)
draw_set_color(global.col_text)
draw_text(cx-200+16,cy-50+16,"Cleaning project...")
cleanup_loadingbar(0)
screen_refresh()

gm82=dsmap(dslist(RECLIST,CURREC),"path")
root=filename_dir(gm82)+"\"

map=dsmap()
ds_map_read_ini(map,gm82)

has_backgrounds=real(dsmap(map,"has_backgrounds"))
has_datafiles=real(dsmap(map,"has_datafiles"))
has_fonts=real(dsmap(map,"has_fonts"))
has_objects=real(dsmap(map,"has_objects"))
has_paths=real(dsmap(map,"has_paths"))
has_scripts=real(dsmap(map,"has_scripts"))
has_sounds=real(dsmap(map,"has_sounds"))
has_sprites=real(dsmap(map,"has_sprites"))
has_timelines=real(dsmap(map,"has_timelines"))
has_triggers=real(dsmap(map,"has_triggers"))

delete_log=""
files=0
saved=0
folders=0

fn=root+"game_errors.log"
if (file_exists(fn)) {
    delete_file(fn)
}

cleanup_loadingbar(1)

if (has_backgrounds) {
    backgrounds=load_index("backgrounds")
    check_tree_vs_index("backgrounds",backgrounds,".txt")
    for (f=file_find_first(root+"backgrounds\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="tree.yyd") continue
        if (ds_list_find_index(backgrounds,filename_change_ext(f,""))==-1) {
            delete_file(root+"backgrounds\"+f)
        }
    }file_find_close()
    for (f=file_find_first(root+"cache\backgrounds\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f=="..") continue
        if (ds_list_find_index(backgrounds,filename_change_ext(f,""))==-1) {
            delete_file(root+"cache\backgrounds\"+f)
        }
    }file_find_close()
    ds_list_destroy(backgrounds)
} else {
    delete_directory(root+"backgrounds")
    delete_directory(root+"cache\backgrounds")
}

cleanup_loadingbar(2)

if (has_datafiles) {
    datafiles=load_index("datafiles")
    for (f=file_find_first(root+"datafiles\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="include") continue
        if (ds_list_find_index(datafiles,filename_change_ext(f,""))==-1) {
            delete_file(root+"datafiles\"+f)
            delete_file(root+"datafiles\include\"+string_copy(f,1,string_length(f)-3))
        }
    }file_find_close()
    ds_list_destroy(datafiles)
} else {
    delete_directory(root+"datafiles")
}

cleanup_loadingbar(3)

if (has_fonts) {
    fonts=load_index("fonts")
    check_tree_vs_index("fonts",fonts,".txt")
    for (f=file_find_first(root+"fonts\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="tree.yyd") continue
        if (ds_list_find_index(fonts,filename_change_ext(f,""))==-1) {
            delete_file(root+"fonts\"+f)
        }
    }file_find_close()
    ds_list_destroy(fonts)
} else {
    delete_directory(root+"fonts")
}

cleanup_loadingbar(4)

if (has_objects) {
    objects=load_index("objects")
    check_tree_vs_index("objects",objects,".txt")
    for (f=file_find_first(root+"objects\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="tree.yyd") continue
        if (ds_list_find_index(objects,filename_change_ext(f,""))==-1) {
            delete_file(root+"objects\"+f)
        }
    }file_find_close()
    ds_list_destroy(objects)
} else {
    delete_directory(root+"objects")
}

cleanup_loadingbar(5)

if (has_paths) {
    paths=load_index("paths")
    check_tree_vs_index("paths",paths,"\path.txt")
    i=0
    for (f=file_find_first(root+"paths\*",fa_directory);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="tree.yyd") continue
        if (ds_list_find_index(paths,f)==-1) {
            delete[i]=root+"paths\"+f i+=1
        }
    }file_find_close()

    repeat (i) {
        i-=1
        delete_directory(delete[i])
    }
} else {
    delete_directory(root+"paths")
}

cleanup_loadingbar(6)

if (has_scripts) {
    scripts=load_index("scripts")
    check_tree_vs_index("scripts",scripts,".gml")
    for (f=file_find_first(root+"scripts\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="tree.yyd") continue
        if (ds_list_find_index(scripts,filename_change_ext(f,""))==-1) {
            delete_file(root+"scripts\"+f)
        }
    }file_find_close()
    ds_list_destroy(scripts)
} else {
    delete_directory(root+"scripts")
}

cleanup_loadingbar(7)

if (has_sounds) {
    sounds=load_index("sounds")
    check_tree_vs_index("sounds",sounds,".txt")
    for (f=file_find_first(root+"sounds\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="tree.yyd") continue
        if (ds_list_find_index(sounds,filename_change_ext(f,""))==-1) {
            delete_file(root+"sounds\"+f)
        }
    }file_find_close()
    ds_list_destroy(sounds)
} else {
    delete_directory(root+"sounds")
}

cleanup_loadingbar(8)

if (has_sprites) {
    sprites=load_index("sprites")
    check_tree_vs_index("sprites",sprites,"\sprite.txt")
    i=0
    for (f=file_find_first(root+"sprites\*",fa_directory);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="tree.yyd") continue
        spr=root+"sprites\"+f
        if (ds_list_find_index(sprites,f)==-1) {
            delete[i]=spr i+=1
        } else {
            f=file_text_open_read(spr+"\sprite.txt")
            frames=real(string_digits(file_text_read_string(f)))
            file_text_close(f)
            j=frames while file_exists(spr+"\"+string(j)+".png") j+=1
            repeat (j-frames) {j-=1
                delete_file(spr+"\"+string(j)+".png")
            }
        }
    }file_find_close()
    repeat (i) {
        i-=1
        delete_directory(delete[i])
    }
    for (f=file_find_first(root+"cache\sprites\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f=="..") continue
        if (ds_list_find_index(sprites,filename_change_ext(f,""))==-1) {
            delete_file(root+"cache\sprites\"+f)
        }
    }file_find_close()

} else {
    delete_directory(root+"sprites")
    delete_directory(root+"cache\sprites")
}

cleanup_loadingbar(9)

if (has_timelines) {
    timelines=load_index("timelines")
    check_tree_vs_index("timelines",timelines,".gml")
    for (f=file_find_first(root+"timelines\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="tree.yyd") continue
        if (ds_list_find_index(timelines,filename_change_ext(f,""))==-1) {
            delete_file(root+"timelines\"+f)
        }
    }file_find_close()
    ds_list_destroy(timelines)
} else {
    delete_directory(root+"timelines")
}

cleanup_loadingbar(10)

if (has_triggers) {
    triggers=load_index("triggers")
    for (f=file_find_first(root+"triggers\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd") continue
        if (ds_list_find_index(triggers,filename_change_ext(f,""))==-1) {
            delete_file(root+"triggers\"+f)
        }
    }file_find_close()
    ds_list_destroy(triggers)
} else {
    delete_directory(root+"triggers")
}

cleanup_loadingbar(11)

//rooms
rooms=load_index("rooms")
check_tree_vs_index("rooms",rooms,"\room.txt")
i=0 j=0
for (f=file_find_first(root+"rooms\*",fa_directory);f!="";f=file_find_next()) {
    if (f=="." || f==".." || f=="index.yyd" || f=="tree.yyd") continue
    rom=root+"rooms\"+f
    if (!directory_exists(rom)) {
        //it's actually a stray file. in the room folder
        delete_file(rom)
    } else if (ds_list_find_index(rooms,f)==-1) {
        delete[i]=rom i+=1
    } else {
        check[j]=rom j+=1 
    }
}file_find_close()
repeat (i) {
    i-=1
    delete_directory(delete[i])
}
repeat (j) {
    j-=1    
    delete_directory(check[j]+"\autosave")
    instances=file_text_read_all(check[j]+"\instances.txt")
    for (f=file_find_first(check[j]+"\*.gml",0);f!="";f=file_find_next()) {        
        if (f!="code.gml") {
            if (!string_pos(filename_change_ext(f,""),instances)) {
                delete_file(check[j]+"\"+f)
            }
        }
    }file_find_close()
}
ds_list_destroy(rooms)
instances=""


//count and finish
screen_redraw()
projname=dsmap(dslist(RECLIST,CURREC),"name")
cleanupmsg='Cleanup of project "'+projname+'":##'
if (files==0 && folders=0) {
    show_message(cleanupmsg+"No cleanup was necessary at this moment.")
} else {
    if (saved<1024) saved=string(saved)+" bytes"
    else if (saved<1024*1024) saved=string(saved/1024)+" KB"
    else saved=string(saved/1024/1024)+" MB"

    if (files==1) files="1 file"
    else files=string(files)+" files"

    if (folders==1) folders="1 folder"
    else folders=string(folders)+" folders"

    cleanupmsg+="- "+folders+" removed#- "+files+" deleted#- "+saved+" saved"
    
    if (show_question(cleanupmsg+"##Would you like to see a log of the deleted files?")) {
        fn=temp_directory+"\"+filename_valid(projname)+" - cleanup.log"
        file_text_write_all(fn,string_replace_all(cleanupmsg,"#",chr_crlf)+chr_crlf+chr_crlf+delete_log)
        execute_program("notepad",fn,false)
    }
}

dsmap(dsmap(dslist(RECLIST,CURREC),"meta"),"cleanstamp",date_current_datetime())

save_recent_meta()
