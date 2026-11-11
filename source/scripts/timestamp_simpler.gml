if (is_undefined(argument0) or string(argument0)=="-1") return "Never"

return
    date_datetime_string(argument0)
   +" ("
   +timespan_simpler(date_second_span(argument0,date_current_datetime()))
   +" ago)"
