///gex_decrypt_part(buffer,pos,length)
var i,b,l;

b=argument0
l=argument1+argument2

for (i=argument1;i<l;i+=1) {
    buffer_poke(b,i,GEXTABLE[buffer_peek(b,i)])
}
