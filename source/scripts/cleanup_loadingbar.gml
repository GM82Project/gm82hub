cx=WIDTH div 2
cy=HEIGHT div 2

draw_button_ext(cx-200+16,cy+50-16-32,400-32,32,0,global.col_main)
draw_rect(cx-200+16+4,cy+50-16-32+4,(400-32-8)*(argument0/12),32-8,color_inverse(global.col_main))
screen_refresh()
io_handle()
sleep(10)
