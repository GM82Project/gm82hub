switch (action) {
    case "lasttab": {TAB=tab_recent} break
    case "uptab": {TAB=tab_updates} break
    case "settab": {TAB=tab_settings} break
    case "tooltab": {TAB=tab_tools} break

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
    case "cleangmk": {
        clean_game()
    } break

}
