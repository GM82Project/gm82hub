var f;

f=filename_dir(argument0)+"\"+file_find_first(argument0,fa_directory) file_find_close()

if (f!=argument0) {
    problem+=filename_name(f)+" was renamed to "+filename_name(argument0)+"#"
    breakage+=1
    rename_file(f,argument0)
}
