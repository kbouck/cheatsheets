
# tcp client

```python
import socket

server IP = '127.0.0.1' # Enter your IP here
server port = 5678 # depending on what you use your listener for.

with socket.socket(socket.AF INET, socket.SOCK STREAM) as sock:
    sock.connect((server IP, server port)) # connects
    # How many bytes it should process before running code below
    message = sock.recv(1024)
    print (message)

```


# tcp server

```python
import socket

server IP = '127.0.0.1' # Enter your IP here
server port = 5678
with socket.socket (socket.AF INET, socket.SOCK STREAM) as sock:
    sock.bind((server IP, server port))
    sock. listen(1)
    connect, addr = sock.accept()
    # this with statement will close the connection before exec more code.
    with connect:
        while True:
            # any messages sent must be sent in binary
            send(b'some text')
            break # breaks connection and closes out.

```





# http client

```python
import requests
import json

# session
session = requests.session()

# cookies
session.cookies.get_dict()

# headers
headers={"Content-Type":"text"}

# get
r = session.get("https://www.google.com/...")
print(r.text)

# post
payload = {
  'eleven': 'MBB',
  'hopper': 'DKH'
}
res = session.post('https://httpbin.org/post', data=payload[, headers=headers])
res = session.post('https://httpbin.org/post', json=payload[, headers=headers])


print(res.text)
```



httpbin.org/post echos what was sent, so this returns:

```json
{
  "args": {},
  "data": "",
  "files": {},
  "form": {
    "eleven": "MBB",
    "hopper": "DKH"
  },
  "headers": {
    "Accept": "*/*",
    "Accept-Encoding": "gzip, deflate",
    "Content-Length": "21",
    "Content-Type": "application/x-www-form-urlencoded",
    "Host": "httpbin.org",
    "User-Agent": "python-requests/2.23.0",
    "X-Amzn-Trace-Id": "Root=1-5ef04d9e-3b7860a6206c465070c08258"
  },
  "json": null,
  "origin": "43.250.156.99",
  "url": "https://httpbin.org/post"
}
```

# http json client

```python 
import requests
import json

API_TOKEN = '...'

HEADERS = {
    'accept': 'application/json'
}


url = 'https://...'
payload = {
    'a': 'a',
    'b': 'b'
}

def get_status:
    response = requests.post(url, json=payload, headers =HEADERS)
    data = response.text
    status = data['status']
    id = data['id']
    return id, status


id, status = get_status


```



# http server

## simple web server

```bash
# python 3
python3 -m http.server          # defaults to port 8000, local directory

# params
8000
--directory /tmp/
--bind 127.0.0.1


# python 2
python -m SimpleHTTPServer 8000

```




## Twistd

    twistd -no web --path .


Options

    web                  A general-purpose web server which can serve from a filesystem or application resource
    -n, –-nodaemon       don’t daemonize, don’t use default umask of 0077
    -o, -–no_save        do not save state on shutdown
        --listen=        eg. tcp:8080
        –-path=          directory (or file) to be set as the root of the web server
    -c, -–certificate=   SSL certificate to use for HTTPS. [default: server.pem]
    -k, –-privkey=       SSL private key



If you are looking for HTTPS and SSL support, consider the following options:



