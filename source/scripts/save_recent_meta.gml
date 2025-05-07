var map,meta,name,metafn,dir;

map=dslist(RECLIST,CURREC)

meta=dsmap(map,"meta")
name=dsmap(map,"path")

dir=filename_dir(name)+"\cache"
directory_create(dir)
metafn=dir+"\gm82hub.meta"

ds_map_write_ini(meta,metafn)
