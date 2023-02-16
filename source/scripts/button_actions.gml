switch (action) {
    case "lasttab": {TAB=tab_recent} break
    case "newstab": {TAB=tab_news} break
    case "docstab": {TAB=tab_help} break
    case "updatestab": {TAB=tab_updates} break

    case "opengmk": {
        window_minimize()
        execute_program(GAMEMAKER,qt+dsmap(dslist(RECLIST,CURREC),"path")+qt,0)
    } break
    case "rungmk": {
        run_game()
    } break
    case "compilegmk": {
        exe=get_save_filename("Windows EXE Runtime|*.exe",dsmap(dslist(RECLIST,CURREC),"name")+".exe")
        if (exe!="")
            execute_program(GAMEMAKER,qt+dsmap(dslist(RECLIST,CURREC),"path")+qt+" --build "+qt+exe+qt,0)
    } break
}
