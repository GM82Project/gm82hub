///valid_variable_name(str,type)
//makes a name valid
var valchrs1,valchrs2,l,i,out;

valchrs1="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_"
valchrs2=valchrs1+"0123456789"

out=""

l=string_length(argument0)

i=1 while (i<l and !string_pos(string_char_at(argument0,i),valchrs1)) i+=1

repeat (l-i) {
    c=string_char_at(argument0,i)
    if (string_pos(c,valchrs2)) out+=c
i+=1}

if (string_length(out)<4) out+="_"+argument1+"_"string(irandom_range(100000,999999))

return out
