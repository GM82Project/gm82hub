up=!down

switch (action) {
    case "lasttab": {up=(TAB!=tab_recent) && !down} break
    case "uptab": {up=(TAB!=tab_updates) && !down} break
    case "settab": {up=(TAB!=tab_settings) && !down} break
    case "tooltab": {up=(TAB!=tab_tools) && !down} break
}

if (object_index==Button) {
    if (gray) up=0

    draw_button_ext(x,y,w,h,up,color)

    if (text!="") {
        draw_set_color(global.col_text)
        if (type==0) {
            draw_set_halign(1)
            draw_set_valign(1)
            if (spr!=noone) draw_text(x+w/2+4,y+h/2-1,text)
            else draw_text(x+w/2,y+h/2-1,text)
            draw_set_halign(0)
            draw_set_valign(0)
        }
        if (type==1) {
            draw_set_valign(1)
            draw_text(x+w+8,y+h/2,text)
            draw_set_valign(0)
        }
        draw_set_color($ffffff)
    }
    if (spr!=noone) {
        if (text!="") draw_sprite(sprMenuButtons,spr,x+floor(w/2-string_width(text)/2+4),y+floor(h/2))
        else draw_sprite(sprMenuButtons,spr,x+floor(w/2),y+floor(h/2))
    }
}

if (object_index==TextField) {
    if (type==1) {if (gray) color=global.col_main else color=real(text)}
    else {
        if (active) color=merge_color(global.col_high,$ffffff,0.75)
        else {
            if (type==0 || type==2) {
                if (gray) color=global.col_main
                else color=merge_color(global.col_high,$ffffff,0.5)
            } else {
                color=merge_color(global.col_high,$ffffff,0.5)
            }
        }
    }

    draw_button_ext(x,y,w,h,0,color)

    if (text="") {
        str=dtext
        draw_set_color(global.col_main)
    } else {
        str=text
        draw_set_color(global.col_text)
    }
    draw_set_valign(1)
    draw_text(x+8,y+h/2,str)
    draw_set_valign(0)
    draw_set_color($ffffff)
}
