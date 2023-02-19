///parse_johnny(extname,string)
var str,map,p,help,desc,name,args;

repeat (string_token_start(argument1,chr_crlf)) {
    str=string_token_next()

    map=dsmap()

    p=string_pos("|",str)
    help=string_copy(str,1,p-1)
    desc=string_delete(str,1,p)

    p=string_pos("(",help)
    name=string_copy(str,1,p-1)
    args=string_delete(str,1,p)
    args=string_copy(args,1,string_pos(")",args)-1)
    dsmap(map,"ext",argument0)
    dsmap(map,"name",name)
    dsmap(map,"args",args)
    dsmap(map,"desc",desc)

    ds_list_add(FUNCLIST,map)
}
