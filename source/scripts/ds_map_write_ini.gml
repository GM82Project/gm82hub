///ds_map_write_ini(map,filename)
    //map: ds map index
    //filename: string, file to save
    //Returns: whether the function was successful
    //Writes a dsmap into an ini file. Spaces are used to split key sections.
    var __map,__f,__section,__key,__val,__p;

    __map=argument0

    ini_open("temp.ini")
    __key=ds_map_find_first(__map) repeat (ds_map_size(__map)) {
        __val=ds_map_find_value(__map,__key)
        __p=string_pos(" ",__key)
        if (__p) {
            __section=string_copy(__key,1,__p-1)
            __key=string_delete(__key,1,__p)
        } else __section=""
        ini_write_string(__section,__key,string_better(__val))
    __key=ds_map_find_next(__map,__key)}
    ini_close()

    sleep(1) //always sleep after file i/o!
    file_delete(argument1)
    sleep(1)
    file_rename("temp.ini",argument1)
    sleep(1)
    file_delete("temp.ini")
    return file_exists(argument1)
