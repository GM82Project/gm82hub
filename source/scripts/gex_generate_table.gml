///gex_generate_table(buffer)
var b,seed,sa,sb,table,i,j,tmp;

b=argument0

globalvar GEXTABLE;

seed=buffer_read_u32(b)

//generate swap table
    sa = 6 + (seed mod 250)
    sb = seed div 250

    for (i=0;i<256;i+=1) {
        table[i]=i
        GEXTABLE[i]=i
    }

    for (i=1;i<10001;i+=1) {
        j = 1 + ((i * sa + sb) mod 254)
        tmp=table[j]
        table[j]=table[j + 1]
        table[j + 1]=tmp
    }

    for (i=1;i<256;i+=1) {
        GEXTABLE[table[i]] = i
    }
