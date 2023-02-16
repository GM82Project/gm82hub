///undo_extension_dat_encryption(buffer)
var b,seed,sa,sb,table,revtable,i,j,tmp;

b=argument0

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

//decrypt
    for (i=5;i<buffer_get_size(b);i+=1) {
        //swap & table
        buffer_set_pos(b,i)
        tmp=buffer_read_u8(b)
        buffer_set_pos(b,i)
        buffer_write_u8(b,revtable[tmp])
    }
