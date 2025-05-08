///drawtooltip(str)
var w,h,str,l;

str=argument0

l=string_length(str)
if (string_char_at(str,l)==chr_lf) str=string_copy(str,1,l-1)

str=string_replace_all(str,chr_lf,chr_crlf)

w=string_width_ext(str,-1,WIDTH*0.5)+8
h=string_height_ext(str,-1,WIDTH*0.5)+8

x1=median(0,MOUSE_X,WIDTH-w)
y1=median(0,MOUSE_Y+32,HEIGHT-h)

if (y1+h==HEIGHT) y1=MOUSE_Y-h-16

draw_rectangle_color(x1,y1,x1+w,y1+h,$ddffff,$ddffff,$ddffff,$ddffff,0)
draw_rectangle_color(x1,y1,x1+w,y1+h,0,0,0,0,1)
draw_text_ext_color(x1+4,y1+4,str,-1,WIDTH*0.5,0,0,0,0,1)
