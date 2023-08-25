var b,b2;

clear_func_list()

b=buffer_create()
buffer_load(b,working_directory+"\help\"+argument0+".hlp")

if (buffer_read_data(b,6)=="Johnny") {
    b2=buffer_create()
    buffer_copy_part(b2,b,7,buffer_get_size(b)-7)
    buffer_inflate(b2)
    parse_johnny(argument0,buffer_read_data(b2,buffer_get_size(b2)))
    buffer_destroy(b2)
}
buffer_destroy(b)
