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

    case "theme dark": {theme=0 theme_apply() theme_save()} break
    case "theme light": {theme=1 theme_apply() theme_save()} break
    case "theme custom": {theme=2 theme_apply() theme_save()} break
    case "theme custom hard": {themebutton=0 theme_apply() theme_save()} break
    case "theme custom soft": {themebutton=1 theme_apply() theme_save()} break
    case "theme custom edge": {themebutton=2 theme_apply() theme_save()} break
    case "theme custom col mid": {global.col_main=get_color(global.col_main) text=string(global.col_main) theme_apply() theme_save()} break
    case "theme custom col up": {global.col_high=get_color(global.col_high) text=string(global.col_high) theme_apply() theme_save()} break
    case "theme custom col down": {global.col_low=get_color(global.col_low) text=string(global.col_low) theme_apply() theme_save()} break
    case "theme custom col text": {global.col_text=get_color(global.col_text) text=string(global.col_text) theme_apply() theme_save()} break
}
