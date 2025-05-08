switch (action) {
    case "lasttab": {TAB=tab_recent} break
    case "uptab": {TAB=tab_updates} break
    case "settab": {TAB=tab_settings} break
    case "tooltab": {TAB=tab_tools} break

    case "opengmk": {
        with (ctrl) edit_game()
    } break
    case "rungmk": {
        with (ctrl) run_game()
    } break
    case "compilegmk": {
        with (ctrl) compile_game()
    } break
    case "browsegmk": {
        with (ctrl) browse_game()
    } break
    case "cleangmk": {
        with (ctrl) clean_game()
    } break
    case "gitgmk": {
        with (ctrl) git_game()
    } break
    case "website": {
        url_open("https://gm82.cherry-treehouse.com")
    } break

}
