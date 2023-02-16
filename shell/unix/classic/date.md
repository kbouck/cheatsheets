# cheatsheet

```bash
# current date/time (portable)
date "+%Y"                            # current year (2022)
date "+%m"                            # current month, 2-digit (01..12)
date "+%d"                            # current day-of-month, 2-digit (01..31)
date "+%Y%m%d"                        # 'yyyyMMdd'
date "+%Y-%m-%d"                      # 'yyyy-MM-dd'
date "+%Y-%m-%dT%H:%M:%S%z"           # iso8601
env TZ="Europe/Helsinki" date ...     # set TZ for
date +%s                              # in epoch seconds 

# current date/time (mac)


# current date/time (linux-only)
date "+%Y-%m-%dT%H:%M:%S%:z"
date --iso-8601=sec                   # iso8601 seconds (2022-07-12T08:02:51+00:00)
date --rfc-3339=sec                   # rfc3339 seconds (2022-07-12 08:01:12+00:00)
                                      # date, hours, minutes, seconds, ns
                                      
                                      

# format strings
%Y                                    # year, 4-digit
%m                                    # month, 2-digit
%d                                    # day of month, 2-digit
%U                                    # week (0-based, sun-sat)
%W                                    # week (0-based, mon-sun)
%z                                    # timezone +0200
%:z                                   # timezone +02:00

# UTC
# -u   convert date to UTC time
date -u                               # Current date in UTC Time
date +%s                              # UTC time in epoch seconds 
echo $(date +%s)000                   # approx UTC time in epoch milliseconds (by appending 000)  
printf %s000 "$(date +%s)"            # approx UTC time in epoch milliseconds (by appending 000) 

# ISO8601 (yyyy-MM-ddTHH:mm:ss)
date -u "+%Y-%m-%dT%H:%M:%SZ"         # current date in ISO8601 seconds
date -u "+%Y-%m-%dT%H:%M:%S.%3NZ"     # current date in ISO8601 milliseconds 
                                      # Note! %3N works on linux, but not BSD, OSX, AIX
date -u "+%Y-%m-%dT%H:%M:%S.000Z"     # current date in ISO8601 milliseconds (approx. setting millis to zero)

# convert
date -r <epoch-seconds>	                    # convert epoch seconds to ...
date -j -f '%m/%d/%y' '11/03/21' '+%Y%m%d'  # convert from 'MM/dd/yy' to 'yyyyMMdd' (j: do not set date, f: input format)
```

