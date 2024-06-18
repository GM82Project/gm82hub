switch (action) {
    case "lasttab": {TAB=tab_recent} break
    case "newstab": {TAB=tab_news} break
    case "docstab": {TAB=tab_help} break
    case "updatestab": {TAB=tab_updates} break

    case "opengmk": {
        edit_game()
    } break
    case "rungmk": {
        run_game()
    } break
    case "compilegmk": {
        compile_game()
    } break
    case "browsegmk": {
        browse_game()
    } break

}
