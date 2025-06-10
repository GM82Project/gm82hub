///rename_asset(type,old,new)
var type,old,new;

type=argument0
old=argument1
new=argument2

var dir;

dir=root+type+"\"

switch (type) {
    case "backgrounds": {
        rename_file(dir+old+".txt",dir+new+".txt")
        rename_file(dir+old+".png",dir+new+".png")
    }break

    case "fonts": {
        rename_file(dir+old+".txt",dir+new+".txt")
    }break

    case "objects":
    case "triggers": {
        rename_file(dir+old+".txt",dir+new+".txt")
        rename_file(dir+old+".gml",dir+new+".gml")
    }break

    case "paths":
    case "sprites":
    case "rooms": {
        rename_file(dir+old,dir+new)
    }break

    case "scripts":
    case "timelines": {
        rename_file(dir+old+".gml",dir+new+".gml")
    }break

    case "sounds": {
        rename_file(dir+old+".txt",dir+new+".txt")
        sleep(10) //always sleep after file i/o!
        ext=get_sound_extension(dir+new+".txt")
        rename_file(dir+old+ext,dir+new+ext)
    }break

}
