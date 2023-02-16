
# SSL

## Test an SSL Handshake using OpenSSL as the SSL client

To test an SSL connection to server and to display the server's certificate chain:

```bash
openssl s_client -connect hostname:port -verify 6 -showcerts -state -msg
```

Where 
hostname:port is the hostname and port of the server you are testing.

The "-state" option will show each change in SSL handshake state, and thus will show you at which point in the handshake it is failing.

You can compare the output to a known-to-be-working server which presents a correct chain, and where the SSL handshake is successful (eg. advantage.webmethods.com:443).

More options: http://www.openssl.org/docs/apps/s_client.html#


## Test an SSL Handshake using OpenSSL as the SSL client, traversing an SSL Proxy

Testing an SSL handshake over an HTTP proxy can be done usine cURL. See cURL Cheatsheet for instructions.


## Test an SSL Handshake using OpenSSL as the SSL server

OpenSSL can be used to emulate an SSL server, simulating an external partner SSL server.

Note! - On some versions of OpenSSL, the cert and key must be in PEM format - use the DER -> PEM conversion instructions listed in this article if needed.


## Create an SSL server which will not use Client Authentication

```bash
openssl todo...
```


## Create an SSL server which will REQUEST Client Authentication

```bash
openssl s_server -accept <port> -cert cert.pem -key key.pem -verify <arg>
```


## Create an SSL server which will REQUIRE Client Authentication

```bash
openssl s_server -accept <port> -cert cert.pem -key key.pem -Verify 3
```

