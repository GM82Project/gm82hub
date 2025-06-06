///check_tree_vs_index(treename,index,suffix)

var tree,tree_real,treefn,indexfn,token,obj,index;

tree=dslist()
tree_real=dslist()

treefn=root+argument0+"\tree.yyd"
indexfn=root+argument0+"\index.yyd"

repeat (string_token_start(file_text_read_all(treefn,chr_lf),chr_lf)) {
    token=string_token_next()
    obj=string_trim(token,chr(vk_tab))
    if (string_starts_with(obj,"|")) {
        ds_list_add(tree,string_trim(obj,"|"))
    } else {
        ds_list_add(tree,undefined)
    }
    ds_list_add(tree_real,token)
}

index=argument1

var fail,problem,missing_tree,missing_index,fixed,i;

missing_tree=dslist()
missing_index=dslist()

fail=false fixed=false

i=0 repeat (ds_list_size(index)) {
    obj=ds_list_find_value(index,i)
    if (obj!="")
        if (ds_list_find_index(tree,obj)==-1) {fail=true ds_list_add(missing_tree,obj)}
i+=1}

i=0 repeat (ds_list_size(tree)) {
    obj=ds_list_find_value(tree,i)
    if (obj!=undefined)
        if (ds_list_find_index(index,obj)==-1) {fail=true ds_list_add(missing_index,obj)}
i+=1}

if (fail) if (show_question("It looks like the "+argument0+" index is broken. Would you like to attempt an automatic fix?")) {
    problem=""
    i=0 repeat (ds_list_size(missing_tree)) {
        obj=ds_list_find_value(missing_tree,i)
        if (file_exists(root+argument0+"\"+obj+argument2)) {
            //file exists, and is on index, add to tree
            ds_list_add(tree,"|"+obj)
            ds_list_add(tree_real,"|"+obj)
            problem+=obj+" was added to the "+argument0+" tree#"
        } else {
            //file doesn't exist, and is on index, remove from index
            pos=ds_list_find_index(index,obj)
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
            pos=ds_list_find_index(tree,obj)
            ds_list_delete(tree,pos)
            ds_list_delete(tree_real,pos)
            problem+=obj+" was removed from the "+argument0+" tree#"
        }
    i+=1}

    file_text_write_all(treefn,string_replace_all(dslist(tree_real),chr_cr,""))
    file_text_write_all(indexfn,string_replace_all(dslist(index),chr_cr,""))

    fixed=true
    index_log+=problem //outer instance variable
}

ds_list_destroy(tree_real)
ds_list_destroy(tree)
ds_list_destroy(missing_tree)
ds_list_destroy(missing_index)

return fixed
