///string_numbular(value,label)
var str;

if (argument0<1) return ""

str=
    string_repeat(", ",numbular_prefix)
   +string(floor(argument0))
   +" "+argument1
   +string_repeat("s",argument0>=2)

numbular_prefix=1

return str
