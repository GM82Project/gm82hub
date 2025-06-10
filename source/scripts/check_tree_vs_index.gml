///check_tree_vs_index(treename,index,suffix)

var write_tree,problem,tree,tree_real,treefn,indexfn,token,obj,index,item,fail,fixed;

tree=dslist()
tree_real=dslist()

treefn=root+argument0+"\tree.yyd"
indexfn=root+argument0+"\index.yyd"

write_tree=false
fail=false fixed=false
problem=""

repeat (string_token_start(file_text_read_all(treefn,chr_lf),chr_lf)) {
    token=string_token_next()
    obj=string_trim(token,chr(vk_tab))
    if (string_starts_with(obj,"|")) {
        item=string_trim(obj,"|")
        if (ds_list_search_uncase(tree,item)!=-1) {
            if not (fail) {
                fail=true
                fixed=show_question("It looks like the "+argument0+" tree has duplicate entries. Would you like to fix that?")
            }
            if (fixed) {
                index_log+=item+" was removed from the "+argument0+" tree#"
                breakage+=1
            } else {
                ds_list_add(tree,item)
                ds_list_add(tree_real,token)
            }
        } else {
            ds_list_add(tree,item)
            ds_list_add(tree_real,token)
        }
    } else {
        ds_list_add(tree,undefined)
        ds_list_add(tree_real,token)
    }
}

write_tree=fixed

index=argument1

var missing_tree,missing_index,i;

missing_tree=dslist()
missing_index=dslist()

fail=false fixed=false

i=0 repeat (ds_list_size(index)) {
    obj=ds_list_find_value(index,i)
    if (obj!="") {
        if (ds_list_search_uncase(tree,obj)==-1) {fail=true ds_list_add(missing_tree,obj)}
        if (invalid_variable_name(obj)) {unfixable+=1 unfixable_log+=remove_plural(argument0)+" "+obj+" has an invalid name#"}
    }
i+=1}

i=0 repeat (ds_list_size(tree)) {
    obj=ds_list_find_value(tree,i)
    if (obj!=undefined)
        if (ds_list_search_uncase(index,obj)==-1) {fail=true ds_list_add(missing_index,obj)}
i+=1}

if (fail) if (show_question("It looks like the "+argument0+" index is broken. Would you like to attempt an automatic fix?")) {
    i=0 repeat (ds_list_size(missing_tree)) {
        obj=ds_list_find_value(missing_tree,i)
        if (file_exists(root+argument0+"\"+obj+argument2)) {
            //file exists, and is on index, add to tree
            ds_list_add(tree,"|"+obj)
            ds_list_add(tree_real,"|"+obj)
            problem+=obj+" was added to the "+argument0+" tree#"
        } else {
            //file doesn't exist, and is on index, remove from index
            pos=ds_list_search_uncase(index,obj)
            ds_list_delete(index,pos)
            problem+=obj+" was removed from the "+argument0+" index#"
        }
    i+=1}
    i=0 repeat (ds_list_size(missing_index)) {
        obj=ds_list_find_value(missing_index,i)
        if (file_exists(root+argument0+"\"+obj+argument2)) {
            //file exists, and is on tree, add to index
            ds_list_add(index,obj)
            problem+=obj+" was added to the "+argument0+" index#"
        } else {
            //file doesn't exist, and is on tree, remove from tree
            pos=ds_list_search_uncase(tree,obj)
            ds_list_delete(tree,pos)
            ds_list_delete(tree_real,pos)
            problem+=obj+" was removed from the "+argument0+" tree#"
        }
    i+=1}

    write_tree=true

    fixed=true
    index_log+=problem //outer instance variable
}

if (write_tree) {
    file_text_write_all(treefn,string_replace_all(dslist(tree_real),chr_cr,""))
    file_text_write_all(indexfn,string_replace_all(dslist(index),chr_cr,""))
}

ds_list_destroy(tree_real)
ds_list_destroy(tree)
ds_list_destroy(missing_tree)
ds_list_destroy(missing_index)

return fixed
