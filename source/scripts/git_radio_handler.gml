switch (argument[0]) {
    case "left click": {
        handle=ui_default_handler(argument0,argument1)
        GITPREF=pref
        find_git()
        return handle
    }break
}

return ui_default_handler(argument0,argument1)
