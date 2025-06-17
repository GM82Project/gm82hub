///ds_list_search_uncase(list,term)
//returns if the term is on the list, case insensitive

if (!DEEP_CLEAN) return ds_list_find_index(argument0,argument1)

var i,find;

find=string_lower(argument1)

i=0 repeat (ds_list_size(argument0)) {
    if (string_lower(ds_list_find_value(argument0,i))==find) return i
i+=1}

return -1
