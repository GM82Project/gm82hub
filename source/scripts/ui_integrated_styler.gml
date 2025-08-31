with (argument0) {
    if (type==ui_t_window) exit

    draw_set_font(fntCode)
    draw_set_valign(1)
    draw_set_color(global.col_text)

    if (type==ui_t_label) {
        draw_text(x,y+height div 2-1,text)
    } else if (type==ui_t_radio) or (type==ui_t_check) {
        down=2*(state=="checked")

        draw_sprite_part(global.buttontex,2,0,0,4,4,x,y)
        draw_sprite_part(global.buttontex,2,76,0,4,4,x+height-4,y)
        draw_sprite_part(global.buttontex,2,0,21,4,4,x,y+height-4)
        draw_sprite_part(global.buttontex,2,76,21,4,4,x+height-4,y+height-4)

        draw_sprite_part_ext(global.buttontex,2,5,0,70,4,x+4,y,(height-8)/70,1,$ffffff,1)
        draw_sprite_part_ext(global.buttontex,2,5,21,70,4,x+4,y+height-4,(height-8)/70,1,$ffffff,1)
        draw_sprite_part_ext(global.buttontex,2,0,5,4,15,x,y+4,1,(height-8)/15,$ffffff,1)
        draw_sprite_part_ext(global.buttontex,2,76,5,4,15,x+height-4,y+4,1,(height-8)/15,$ffffff,1)

        if (down) draw_sprite(sprUiIcons,1+(type==ui_t_radio),x+height div 2,y+height div 2)
        draw_text(x+height+4,y+height div 2-1,text)
    } else {
        down=(state!="up")

        if (type==ui_t_panel) down=0

        if (image_blend!=4294967296+noone) {
            if (image_blend==4294967296+ui_default) draw_rect(x,y,width,height,global.col_main)
            else draw_rect(x,y,width,height,image_blend)
        }

        draw_sprite_part(global.buttontex,down*2,0,0,4,4,x,y)
        draw_sprite_part(global.buttontex,down*2,76,0,4,4,x+width-4,y)
        draw_sprite_part(global.buttontex,down*2,0,21,4,4,x,y+height-4)
        draw_sprite_part(global.buttontex,down*2,76,21,4,4,x+width-4,y+height-4)

        draw_sprite_part_ext(global.buttontex,down*2,5,0,70,4,x+4,y,(width-8)/70,1,$ffffff,1)
        draw_sprite_part_ext(global.buttontex,down*2,5,21,70,4,x+4,y+height-4,(width-8)/70,1,$ffffff,1)
        draw_sprite_part_ext(global.buttontex,down*2,0,5,4,15,x,y+4,1,(height-8)/15,$ffffff,1)
        draw_sprite_part_ext(global.buttontex,down*2,76,5,4,15,x+width-4,y+4,1,(height-8)/15,$ffffff,1)

        draw_set_halign(1)
        if (type==ui_t_button) {
            if (button_sprite!=noone) {
                if (text!="") {
                    var sprw;sprw=sprite_get_width(button_sprite)
                    draw_sprite(button_sprite,button_frame,x+6+sprw div 2+down,y+height div 2+down)
                    draw_text(x+(width+sprw+3) div 2+down,y+height div 2+down,text)
                } else draw_sprite(button_sprite,button_frame,x+width div 2+down,y+height div 2+down)
            } else draw_text(x+width div 2+down,y+height div 2+down,text)
        } else draw_text(x+width div 2+down,y+height div 2+down,text)
        draw_set_halign(0)
    }

    draw_set_valign(0)
    draw_set_color($ffffff)

    if (keyfocus) draw_rectangle(x-1,y-1,x+width,y+height,1)
}
