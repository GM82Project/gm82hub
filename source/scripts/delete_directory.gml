///delete_directory(dir)

if (directory_exists(argument0)) {
    var l,p;
    l=file_find_list(argument0+"\","*",0,1,1)
    p=0 repeat (ds_list_size(l)) {
        fn=ds_list_find_value(l,p)
        files+=1
        saved+=file_size(fn)
    p+=1}
    ds_list_destroy(l)

    folders+=1

    execute_program_silent("cmd /C "+qt+"rmdir "+qt+argument0+qt+" /s /q"+qt)
}
