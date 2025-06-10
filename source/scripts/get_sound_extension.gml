//returns the extension of a sound asset
var f,s;

f=file_text_open_read(argument0)
s=string_trim(file_text_read_string(f),"extension=")
file_text_close(f)

return s
