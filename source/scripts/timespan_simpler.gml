var minspan,hourspan,dayspan,monthspan,yearspan;

if (is_undefined(argument0) or is_string(argument0)) return "No data"

if (argument0<60) return "Just now"

minspan=argument0 div 60
hourspan=minspan div 60
dayspan=hourspan div 24
monthspan=(dayspan div 30.4375) mod 12
yearspan=dayspan div 365.25

if (dayspan<1) return string_pad(hourspan mod 24,2)+":"+string_pad(minspan mod 60,2)

if (monthspan<1) return string_plural(dayspan,"day")
if (yearspan<1) return string_plural(monthspan,"month")
return string_plural(yearspan,"year")
