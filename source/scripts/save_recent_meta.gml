var map,meta,name,metafn;

map=dslist(RECLIST,CURREC)

meta=dsmap(map,"meta")
name=dsmap(map,"path")

metafn=filename_dir(name)+"\gm82hub.meta"

ds_map_write_ini(meta,metafn)
