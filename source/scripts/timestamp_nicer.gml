var dayspan,s,s2,s3,hourspan,minspan,yearspan,monthspan;

dayspan=date_day_span(argument0,date_current_datetime())
if (dayspan<1) {
    hourspan=date_hour_span(argument0,date_current_datetime())
    if (hourspan<1) {
        minspan=date_minute_span(argument0,date_current_datetime())
        if (minspan<1) return date_datetime_string(argument0)+" (just now)"
        if (minspan>=2) s="s" else s=""
        return date_datetime_string(argument0)+" ("+string(floor(minspan))+" minute"+s+" ago)"

    } else {
        if (hourspan>=2) s="s" else s=""
        return date_datetime_string(argument0)+" ("+string(floor(hourspan))+" hour"+s+" ago)"
    }
} else {
    yearspan=dayspan div 365
    dayspan=dayspan mod 365
    monthspan=dayspan div 30.436875 //average month
    dayspan=dayspan mod 30.436875
    if (dayspan>=2) s="s" else s=""
    if (yearspan>=2) s2="s" else s2=""
    if (monthspan>=2) s3="s" else s3=""

    str=""
    if (yearspan>=1) str+=string(floor(yearspan))+" year"+s2
    if (monthspan>=1) {if (str!="") str+=", " str+=string(floor(monthspan))+" month"+s3}
    if (dayspan>=1) {if (str!="") str+=", " str+=string(floor(dayspan))+" day"+s}

    return date_datetime_string(argument0)+" ("+str+" ago)"
}
