# cheatsheet


```bash
# headers
-u <user:pass>                   # basic authentication
-H "Header: value"               # header

# data
-d, --data, --data-ascii <data>  # POST form ("x-www-form-urlencoded")
--data-raw <data>                # same as --data, but without interpreting @ character
--data-urlencode <data>          # same as --data, but adds url-encoding 
--data-binary <data>             # POST data exactly as-is, no processing whatsoever
--data-binary @<filename>        # POST file content
--get -d "k1=v1" -d "k2=v2"      # GET w/ query-string vars (explicit GET avoids -d causing a POST)

# cookies
-b, --cookie <cookie-data>       # read cookie(s) from param ("NAME1=VALUE1; NAME2=VALUE2")
-b, --cookie <cookie-file>       # read cookie(s) from cookie-file
-j, --junk-session-cookies       # ignore session cookies from cookie-file
-c, --cookie-jar <cookie-file>   # write cookies to cookie-file
-c, --cookie-jar -               # write cookies to stdout

# request / input
-L, --location                   # follow request redirects

# response / output
-s, --silent                     # suppress progress meter and error messages
-f, --fail                       # fail silently (no output), error code returned
-i, --include                    # output headers
-D, --dump-header <file>         # output headers to file
-o, --output <file>              # output response to file instead of stdout
    --trace <file>               # output hex bytes to file

# ssl
--insecure                       # skip or ignore server verification

# debug
--trace <file>                   # capture bytes sent over wire
-v


# debug using netcat
nc -l localhost 8000 &           # create fake server


```

# cookie file

- https://everything.curl.dev/http/cookies

```bash
# cookie file format
# ==============
# - one cookie per line
# - cookie line contains 7 tab-delimited fields:
#   1. domain name        (string)    example.com
#   2. include subdomains (boolean)   FALSE
#   3. path               (string)    /foobar/
#   4. HTTPS only         (boolean)   TRUE
#   5. expires at         (number)    1462299217
#   6. cookie name        (string)    person
#   7. cookie value       (string)    daniel

# example
www.filefactory.com FALSE / FALSE 0 PHPSESSID 8dcolkh52m2eo4rv61aolurjd7
.filefactory.com TRUE / FALSE 1342341229 ff_referrer_hash HDAgPzI
bitshare.com FALSE / FALSE 0 PHPSESSID qjv4u6g6k20s8brar2o17msk26
bitshare.com FALSE / FALSE 1342401324 last_file_downloaded b5b7gbwq
```



# request

```bash


# form data
  -F "username=demo" \
  -F "password=demo"\
  -F "filecomment=Posting an Image File" \
  -F "image=@/Desktop/picture.jpg" \
```





# json

```bash

# curl script with json in heredoc 
# @-  accept data from stdin
# <<  stdin data as a heredoc 

curl -0 -v -X POST http://www.example.com/api/users \
-H "Expect:" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF
{
    "field1": "test",
    "field2": {
        "foo": "bar"
    }
}
EOF
```

# external

- convert curl to programming language code: https://curlconverter.com/
