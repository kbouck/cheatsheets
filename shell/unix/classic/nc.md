// TODO



# server

```bash
nc -l 8888             # listen on 8888

```



# Chat (local or remote)

```
1. Agree on a port number (eg. 12345)

2. Open one side of the chat (opens a listening port)

    nc -lvp <port>

3. Connect other side to that port 

    nc <host> <port>


Note: Can open up two, in separate windows to avoid clobbering

TODO: arrange with tmux?
```
