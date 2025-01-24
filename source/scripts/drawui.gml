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
            change_currec(i)
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
            timestamp=timestamp_nicer(dsmap(rec,"timestamp"))
            cleanstamp=timestamp_nicer(dsmap(dsmap(rec,"meta"),"cleanstamp"))
            if (timestamp==cleanstamp) cleanstamp="Never"
            draw_text(dx+38,dy+36,dsmap(rec,"path")+"#"+dsmap(rec,"pname")+"#Modified: "+timestamp+"#Last cleaned: "+cleanstamp)
        } else {
            draw_sprite(sprGMK,0,dx,dy+38)
            draw_text(dx+38,dy+36,dsmap(rec,"path")+"#Size: "+string(dsmap(rec,"size")/1024)+"KB"+"#Modified: "+timestamp_nicer(dsmap(rec,"timestamp")))
        }
    } else draw_button_ext(width,32,WIDTH-width,HEIGHT-32,0,noone)
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
