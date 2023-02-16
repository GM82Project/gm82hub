fn=argument0

b=buffer_create()
buffer_load(b,fn)
size=buffer_get_size(b)

seed=buffer_read_u32(b)

//generate swap table
sa = 6 + (seed mod 250)
sb = seed div 250

for (i=0;i<256;i+=1) {
    table[i]=i
    revtable[i]=i
}

for (i=1;i<10001;i+=1) {
    j = 1 + ((i * sa + sb) mod 254)
    tmp=table[j]
    table[j]=table[j + 1]
    table[j + 1]=tmp
}

for (i=1;i<256;i+=1) {
    revtable[table[i]] = i
}

for (i=5;i<buffer_get_size(b);i+=1) {
    buffer_set_pos(b,i)
    tmp=buffer_read_u8(b)
    buffer_set_pos(b,i)
    buffer_write_u8(b,revtable[tmp])
}

buffer_set_pos(b,4)
b2=buffer_create()
len=0

do {
    buffer_set_pos(b,buffer_get_pos(b)+len)
    len=buffer_read_u32(b)

    buffer_clear(b2)
    buffer_copy_part(b2,b,buffer_get_pos(b),len)

    buffer_inflate(b2)

    if (buffer_read_data(b2,6)=="Johnny") {
        buffer_set_pos(b2,0)
        parse_johnny(buffer_read_data(b2,buffer_get_size(b2)))
    }
} until (buffer_get_pos(b)+len>=size)
