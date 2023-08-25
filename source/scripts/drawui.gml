var width,width2;
width=0
width2=0

MOUSE_X=window_mouse_get_x()
MOUSE_Y=window_mouse_get_y()

rect(0,0,WIDTH,32,global.col_main,1)

if (TAB==tab_recent) {
    i=0 repeat (ds_list_size(RECLIST)) {
        width=max(width,string_width(dsmap(dslist(RECLIST,i),"name")))
    i+=1}
    width+=16+16+4

    draw_button_ext(0,32,width,HEIGHT-32,0,global.col_main)

    i=0 repeat (ds_list_size(RECLIST)) {
        dy=36+24*i
        if (clickrect(4,dy,width-8,24)) {
            CURREC=i
        }
        if (CURREC==i) rect(4,dy,width-8,24,global.col_high,1)
        rec=dslist(RECLIST,i)
        texture_set_interpolation(1)
        if (dsmap(rec,"type")) draw_sprite_stretched(dsmap(rec,"icon"),0,8,dy+4,16,16)
        else draw_sprite_stretched(sprGMK,0,8,dy+4,16,16)
        texture_set_interpolation(0)
        draw_text(28,dy+2,dsmap(rec,"name"))
        draw_line_color(4,dy+24,width-4,dy+24,global.col_high,global.col_high)
    i+=1}

    if (CURREC!=noone) {
        width2=WIDTH-width
        rect(width,32,WIDTH-width,32,global.col_main,1)
        draw_line_color(width,32,WIDTH,32,global.col_high,global.col_high)
        draw_button_ext(width,64,WIDTH-width,HEIGHT-64,0,global.col_main)
        dx=width+8
        dy=36

        rec=dslist(RECLIST,CURREC)

        type=dsmap(rec,"type")

        if (type) {
            texture_set_interpolation(1)
            draw_sprite_stretched(dsmap(rec,"icon"),0,dx,dy+38,32,32)
            texture_set_interpolation(0)
            draw_text(dx+38,dy+36,dsmap(rec,"path")+"#"+dsmap(rec,"pname")+"#"+date_datetime_string(dsmap(rec,"timestamp")))
        } else {
            draw_sprite(sprGMK,0,dx,dy+38)
            draw_text(dx+38,dy+36,dsmap(rec,"path")+"#"+string(dsmap(rec,"size")/1024)+"KB"+"#"+date_datetime_string(dsmap(rec,"timestamp")))
        }
    } else draw_button_ext(width,32,WIDTH-width,HEIGHT-32,0,noone)
}

if (TAB==tab_help) {
    i=0 repeat (ds_list_size(EXTLIST)) {
        width=max(width,string_width(dslist(EXTLIST,i)))
    i+=1}
    width+=16

    draw_button_ext(0,32,width,HEIGHT-32,0,global.col_main)

    i=0 repeat (ds_list_size(EXTLIST)) {
        dy=36+24*i
        if (clickrect(4,dy,width-8,24)) {
            if (CUREXT!=i) load_builtin_help(dslist(EXTLIST,i))
            CUREXT=i
        }
        if (CUREXT==i) rect(4,dy,width-8,24,global.col_high,1)
        draw_text(8,dy+2,dslist(EXTLIST,i))
        draw_line_color(4,dy+24,width-4,dy+24,global.col_high,global.col_high)
    i+=1}

    if (CUREXT!=noone) {
        i=0 repeat (ds_list_size(FUNCLIST)) {
            width2=max(width2,string_width(dsmap(dslist(FUNCLIST,i),"name")))
        i+=1}
        width2+=16

        draw_button_ext(width,32,width2,HEIGHT-32,0,global.col_main)

        i=0 repeat (ds_list_size(FUNCLIST)) {
            dy=44+24*i
            map=dslist(FUNCLIST,i)
            if (clickrect(width+4,dy,width2-8,24)) {
                CURFUNC=i
            }
            if (CURFUNC==i) rect(width+4,dy,width2-8,24,global.col_high,1)

            draw_text(width+8,dy+2,dsmap(map,"name"))
        i+=1}
    }

    if (CURFUNC!=noone) {
        draw_button_ext(width+width2,32,WIDTH-width-width2,HEIGHT-32,0,global.col_main)
        map=dslist(FUNCLIST,CURFUNC)

        dx=width+width2+8
        dy=38

        draw_set_font(fntLarge)
        draw_text(dx,dy,dsmap(map,"name"))
        draw_set_font(fntCode)
        args=dsmap(map,"args")
        if (args="") draw_text(dx,dy+40,"no arguments")
        else draw_text(dx,dy+40,args)
        draw_text_ext(dx,dy+80,dsmap(map,"desc"),-1,WIDTH-width-width2-16)
    } else draw_button_ext(width+width2,32,WIDTH-width-width2,HEIGHT-32,0,noone)
}

with (Button) {
    if (anchor&anc_width1) x=width+xstart
    if (anchor&anc_width2) w=width2-8
    if (visibility==vis_open && width2==0) x=-999

    if (mouse_check_button_pressed(mb_left)) if (instance_position(MOUSE_X,MOUSE_Y,id)) {
        event_user(2)
    }

    if (mytab==TAB || mytab==-1) button_draw()
}
