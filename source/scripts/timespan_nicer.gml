var minspan,hourspan,dayspan,monthspan,yearspan;

if (is_undefined(argument0) or is_string(argument0)) return "No data"

if (argument0<60) return "Just started"

minspan=argument0 div 60
hourspan=minspan div 60
dayspan=hourspan div 24
monthspan=(dayspan div 30.4375) mod 12
yearspan=dayspan div 365.25

globalvar numbular_prefix;
numbular_prefix=0

return
   string_numbular(yearspan,"year")
  +string_numbular(monthspan,"month")
  +string_numbular(dayspan mod 30.4375,"day")
  +string_repeat(", ",numbular_prefix)
  +string_pad(hourspan mod 24,2)+":"+string_pad(minspan mod 60,2)
