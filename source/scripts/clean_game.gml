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

files=0
saved=0
folders=0

fn=root+"game_errors.log"
if (file_exists(fn)) {
    files+=1
    saved+=file_size(fn)
    file_delete(fn)
}

if (has_backgrounds) {
    backgrounds=load_index("backgrounds")
    for (f=file_find_first(root+"backgrounds\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="tree.yyd") continue
        if (ds_list_find_index(backgrounds,filename_change_ext(f,""))==-1) {
            fn=root+"backgrounds\"+f
            files+=1
            saved+=file_size(fn)
            file_delete(fn)
        }
    }file_find_close()
    for (f=file_find_first(root+"cache\backgrounds\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f=="..") continue
        if (ds_list_find_index(backgrounds,filename_change_ext(f,""))==-1) {
            fn=root+"cache\backgrounds\"+f
            files+=1
            saved+=file_size(fn)
            file_delete(fn)
        }
    }file_find_close()
    ds_list_destroy(backgrounds)
} else {
    delete_directory(root+"backgrounds")
    delete_directory(root+"cache\backgrounds")
}

cleanup_loadingbar(0.1)

if (has_datafiles) {
    datafiles=load_index("datafiles")
    for (f=file_find_first(root+"datafiles\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="include") continue
        if (ds_list_find_index(datafiles,filename_change_ext(f,""))==-1) {
            fn=root+"datafiles\"+f
            files+=1
            saved+=file_size(fn)
            file_delete(fn)
            fn=root+"datafiles\include\"+string_copy(f,1,string_length(f)-3)
            files+=1
            saved+=file_size(fn)
            file_delete(fn)
        }
    }file_find_close()
    ds_list_destroy(datafiles)
} else {
    delete_directory(root+"datafiles")
}

cleanup_loadingbar(0.2)

if (has_fonts) {
    fonts=load_index("fonts")
    for (f=file_find_first(root+"fonts\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="tree.yyd") continue
        if (ds_list_find_index(fonts,filename_change_ext(f,""))==-1) {
            fn=root+"fonts\"+f
            files+=1
            saved+=file_size(fn)
            file_delete(fn)
        }
    }file_find_close()
    ds_list_destroy(fonts)
} else {
    delete_directory(root+"fonts")
}

cleanup_loadingbar(0.3)

if (has_objects) {
    objects=load_index("objects")
    for (f=file_find_first(root+"objects\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="tree.yyd") continue
        if (ds_list_find_index(objects,filename_change_ext(f,""))==-1) {
            fn=root+"objects\"+f
            files+=1
            saved+=file_size(fn)
            file_delete(fn)
        }
    }file_find_close()
    ds_list_destroy(objects)
} else {
    delete_directory(root+"objects")
}

cleanup_loadingbar(0.4)

if (has_paths) {
    paths=load_index("paths")
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

cleanup_loadingbar(0.5)

if (has_scripts) {
    scripts=load_index("scripts")
    for (f=file_find_first(root+"scripts\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="tree.yyd") continue
        if (ds_list_find_index(scripts,filename_change_ext(f,""))==-1) {
            fn=root+"scripts\"+f
            files+=1
            saved+=file_size(fn)
            file_delete(fn)
        }
    }file_find_close()
    ds_list_destroy(scripts)
} else {
    delete_directory(root+"scripts")
}

cleanup_loadingbar(0.6)

if (has_sounds) {
    sounds=load_index("sounds")
    for (f=file_find_first(root+"sounds\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="tree.yyd") continue
        if (ds_list_find_index(sounds,filename_change_ext(f,""))==-1) {
            fn=root+"sounds\"+f
            files+=1
            saved+=file_size(fn)
            file_delete(fn)
        }
    }file_find_close()
    ds_list_destroy(sounds)
} else {
    delete_directory(root+"sounds")
}

cleanup_loadingbar(0.7)

if (has_sprites) {
    sprites=load_index("sprites")
    i=0
    for (f=file_find_first(root+"sprites\*",fa_directory);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="tree.yyd") continue
        spr=root+"sprites\"+f
        if (ds_list_find_index(sprites,f)==-1) {
            delete[i]=spr i+=1
        } else {
            f=file_text_open_read(spr+"\sprite.txt")
            frames=real(string_digits(file_text_read_string(f)))
            j=frames while file_exists(spr+"\"+string(j)+".png") j+=1
            repeat (j-frames) {
                j-=1
                fn=spr+"\"+string(j)+".png"
                files+=1
                saved+=file_size(fn)
                file_delete(fn)
            }
            file_text_close(f)
        }
    }file_find_close()
    repeat (i) {
        i-=1
        delete_directory(delete[i])
    }
    for (f=file_find_first(root+"cache\sprites\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f=="..") continue
        if (ds_list_find_index(sprites,filename_change_ext(f,""))==-1) {
            fn=root+"cache\sprites\"+f
            files+=1
            saved+=file_size(fn)
            file_delete(fn)
        }
    }file_find_close()

} else {
    delete_directory(root+"sprites")
    delete_directory(root+"cache\sprites")
}

cleanup_loadingbar(0.8)

if (has_timelines) {
    timelines=load_index("timelines")
    for (f=file_find_first(root+"timelines\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd" || f=="tree.yyd") continue
        if (ds_list_find_index(timelines,filename_change_ext(f,""))==-1) {
            fn=root+"timelines\"+f
            files+=1
            saved+=file_size(fn)
            file_delete(fn)
        }
    }file_find_close()
    ds_list_destroy(timelines)
} else {
    delete_directory(root+"timelines")
}

cleanup_loadingbar(0.9)

if (has_triggers) {
    triggers=load_index("triggers")
    for (f=file_find_first(root+"triggers\*.*",0);f!="";f=file_find_next()) {
        if (f=="." || f==".." || f=="index.yyd") continue
        if (ds_list_find_index(triggers,filename_change_ext(f,""))==-1) {
            fn=root+"triggers\"+f
            files+=1
            saved+=file_size(fn)
            file_delete(fn)
        }
    }file_find_close()
    ds_list_destroy(triggers)
} else {
    delete_directory(root+"triggers")
}

cleanup_loadingbar(1)

if (files==0 && folders=0) {
    cleanupstr="No cleanup was performed at this moment."
} else {
    if (saved<1024) saved=string(saved)+" bytes"
    else if (saved<1024*1024) saved=string(saved/1024)+" KB"
    else saved=string(saved/1024/1024)+" MB"

    if (files==1) files="1 file"
    else files=string(files)+" files"

    if (folders==1) folders="1 folder"
    else folders=string(folders)+" folders"

    cleanupstr="- "+folders+" removed#- "+files+" deleted#- "+saved+" saved"
}

screen_redraw()
show_message('Cleanup of project "'+dsmap(dslist(RECLIST,CURREC),"name")+'":##'+cleanupstr)
