

```javascript
// construct
new Date();                           // current datetime
new Date(0);                          // epoch (Jan 1 1970)
new Date("2023-01-02");               // 2023-01-02T00:00:00 (local timezone)
new Date(2023, 0, 2, 0, 0, 0, 0);     // 2011-01-02T00:00:00 (local timezone)
new Date(2023, 0, 2);                 // 2011-01-02T00:00:00 (local timezone)

// access
date.getTime()                        // epoch milliseconds
date.getTimezoneOffset()              // timezone offset in minutes (UTC+1 = 60)
date.getFullYear()                    // 4-digit year
date.getYear()                        // !! deprecated. do not use.
date.getMonth()                       // month, 0..11
date.getDate()                        // day-of-month, 1..31
date.getDay()                         // day-of-week, 0 (sun) .. 6 (sat)
date.getHours()                       //
date.getMinutes()                     // 
date.getSeconds()                     //
date.getMilliseconds()                //
date.getUTC...()                      // same as functions above but in UTC

// parse (todo)


// format (todo)

```

