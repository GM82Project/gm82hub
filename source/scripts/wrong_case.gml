///wrong_case(asset,type)
var type,old;

type=argument1
old=argument0

var dir;

dir=root+type+"\"

switch (type) {
    case "backgrounds": {
        check_file_case(dir+old+".txt")
        check_file_case(dir+old+".png")
    }break

    case "fonts": {
        check_file_case(dir+old+".txt")
    }break

    case "objects":
    case "triggers": {
        check_file_case(dir+old+".txt")
        check_file_case(dir+old+".gml")
    }break

    case "paths":
    case "sprites":
    case "rooms": {
        check_file_case(dir+old)
    }break

    case "scripts":
    case "timelines": {
        check_file_case(dir+old+".gml")
    }break

    case "sounds": {
        check_file_case(dir+old+".txt")
        sleep(10) //always sleep after file i/o!
        ext=get_sound_extension(dir+old+".txt")
        check_file_case(dir+old+ext)
    }break
}
