OneHUB Security Guidelines




# Network / Transport-Level Security


## Rule: Firewall restrictions based on client-IP is not preferred, because clientation is that changing their source IP address will not break connectivity.

- Rationale: Client infrastructure is increasingly dynamic and cloud-based and so can not be associated with consistent IP addresses.
- Implication: Clients/Interface relying on this approach should be migrated to the target approaches.


## Rule: Internet-facing ports must be HTTPS

Rationale: Confidential information such as basic authentication credentials are transmited in HTTP headers and payloads and must be encrypted to prevent third-party snooping.

Implication: 
- Enterprise Gateway External Ports must be HTTPS


Exceptions:
- Interfaces which can not comply with this rule can only be deployed on a reduced-security node


## Cryptography Standards

Rule: 





## SSL 
Rule: Platform may only offer support for SSL/TLS version 3.1 or more recent

- TLS v1.3: Okay to use (as of Nov. 2019)
- TLS v1.2: Okay to use (as of Nov. 2019)
- TLS v1.1: Okay to use (as of Nov. 2019)
- TLS v1.0: Should not be used. Vulnerable to BEAST attack.
- SSL v3.0: Must not be used. Vulnerable to POODLE attack.
- SSL v2.0: Must not be used. Many vulnerabilities. Disabled in many browsers.


Implication:
watt.net.jsse.server.enabledProtocols=TLSv1,TLSv1.1,TLSv1.2
watt.net.ssl.client.handshake.minVersion=tls
watt.net.ssl.client.handshake.maxVersion=tls

watt.net.ssl.server.handshake.minVersion=tls
watt.net.ssl.server.handshake.maxVersion=tls
watt.net.jsse.server.enabledProtocols=TLSv1,TLSv1.1,TLSv1.2



## Cipher Suites


watt.net.ssl.client.useJSSE=false
watt.net.ssl.client.ftps.useJSSE


watt.net.ssl.client.hostnameverification








watt.net.jsse.client.enabledCipherSuiteList=default
watt.net.ssl.client.strongcipheronly=true (Ignores any non-strong cipher suites specified in watt.net.ssl.client.cipherSuiteList)
watt.net.ssl.client.cipherSuiteList=default


watt.net.jsse.server.enabledCipherSuiteList=default
watt.net.ssl.server.cipherSuiteList=default
watt.net.ssl.server.strongcipheronly=true (Ignores any non-strong cipher suites specified in watt.net.ssl.server.cipherSuiteList)







Avoid:
- ADH (Anonymous Diffie-Hellman)
- NULL cipher suites provide no encryption.
- EXPORT cipher suites: insecure when negotiated in a connection, but they can also be used against a server that prefers stronger suites (the FREAK attack).
- Suites with <= 56 bits: weak.
- RC4: insecure
- 3DES: slow and weak.


Use:
TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256
TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384
TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA
TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA
TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256
TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384
TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA
TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256
TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384
TLS_DHE_RSA_WITH_AES_128_GCM_SHA256
TLS_DHE_RSA_WITH_AES_256_GCM_SHA384
TLS_DHE_RSA_WITH_AES_128_CBC_SHA
TLS_DHE_RSA_WITH_AES_256_CBC_SHA
TLS_DHE_RSA_WITH_AES_128_CBC_SHA256
TLS_DHE_RSA_WITH_AES_256_CBC_SHA256


- TODO:
- List disallowed SSL versions, algorithms, etc. (and why)
- List supported SSL versions, algorithms, etc.


Analysis of current:



Disallowed:

TLS_RSA_WITH_AES_256_CBC_SHA
TLS_RSA_WITH_AES_128_CBC_SHA
SSL_RSA_WITH_3DES_EDE_CBC_SHA
SSL_RSA_WITH_IDEA_CBC_SHA
SSL_RSA_WITH_DES_CBC_SHA
SSL_DH_DSS_WITH_DES_CBC_SHA
SSL_DH_DSS_WITH_3DES_EDE_CBC_SHA
SSL_DH_RSA_WITH_DES_CBC_SHA
SSL_DHE_DSS_WITH_DES_CBC_SHA
SSL_DHE_RSA_WITH_DES_CBC_SHA

* SSL_RSA_WITH_RC4_128_SHA
* SSL_RSA_WITH_RC4_128_MD5
* SSL_RSA_WITH_RC4_MD5
* SSL_RSA_WITH_RC4_SHA

* SSL_DH_RSA_EXPORT_WITH_DES40_CBC_SHA
* SSL_DH_DSS_EXPORT_WITH_DES40_CBC_SHA
* SSL_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA
* SSL_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA
* SSL_RSA_EXPORT_WITH_RC4_40_MD5
* SSL_RSA_EXPORT_WITH_RC2_CBC_40_MD5
* SSL_RSA_EXPORT_WITH_DES40_CBC_SHA

* SSL_RSA_WITH_3DES_EDE_CBC_SHA
* SSL_DH_RSA_WITH_3DES_EDE_CBC_SHA
* SSL_DHE_DSS_WITH_3DES_EDE_CBC_SHA
* SSL_DHE_RSA_WITH_3DES_EDE_CBC_SHA

* SSL_DH_anon_EXPORT_WITH_RC4_40_MD5
* SSL_DH_anon_WITH_RC4_MD5
* SSL_DH_anon_EXPORT_WITH_RC4_40_MD5
* SSL_DH_anon_WITH_DES_CBC_SHA
* SSL_DH_anon_WITH_3DES_EDE_CBC_SHA

TLS_EMPTY_RENEGOTIATION_INFO_SCSV


watt.net.ssl.server.cipherSuiteList=TLS_RSA_WITH_AES_256_CBC_SHA,SSL_RSA_WITH_3DES_EDE_CBC_SHA,SSL_RSA_WITH_RC4_128_SHA,TLS_RSA_WITH_AES_128_CBC_SHA,SSL_RSA_WITH_RC4_128_MD5,SSL_RSA_WITH_RC4_MD5,SSL_RSA_WITH_RC4_SHA,SSL_RSA_WITH_IDEA_CBC_SHA,SSL_RSA_WITH_DES_CBC_SHA,SSL_RSA_WITH_3DES_EDE_CBC_SHA,SSL_RSA_EXPORT_WITH_RC4_40_MD5,SSL_RSA_EXPORT_WITH_RC2_CBC_40_MD5,SSL_RSA_EXPORT_WITH_DES40_CBC_SHA,SSL_DH_DSS_EXPORT_WITH_DES40_CBC_SHA,SSL_DH_DSS_WITH_DES_CBC_SHA,SSL_DH_DSS_WITH_3DES_EDE_CBC_SHA,SSL_DH_RSA_EXPORT_WITH_DES40_CBC_SHA,SSL_DH_RSA_WITH_DES_CBC_SHA,SSL_DH_RSA_WITH_3DES_EDE_CBC_SHA,SSL_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA,SSL_DHE_DSS_WITH_DES_CBC_SHA,SSL_DHE_DSS_WITH_3DES_EDE_CBC_SHA,SSL_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA,SSL_DHE_RSA_WITH_DES_CBC_SHA,SSL_DHE_RSA_WITH_3DES_EDE_CBC_SHA,SSL_DH_anon_EXPORT_WITH_RC4_40_MD5,SSL_DH_anon_WITH_RC4_MD5,SSL_DH_anon_EXPORT_WITH_RC4_40_MD5,SSL_DH_anon_WITH_DES_CBC_SHA,SSL_DH_anon_WITH_3DES_EDE_CBC_SHA,TLS_EMPTY_RENEGOTIATION_INFO_SCSV





## External Ports

                
Port  Transport Client Authentication 
----  --------- -
22100 HTTP      None






# User Access Control

## a
- System must enforce user authentication and authorization

- User accounts must be for named individuals, not shared among groups


## Logging/Auditing/Monitoring
- Failed login attempts must be logged


## Password Policy
- TODO: list of password rules
- Rationale: Onerous password rules can cause unsafe password practices


## User Types

- Administrator
- Internal Partner
- External Partner


## Session Cookies


## JSON Web Tokens
- "JWT" - pronounced "jawt"
- See jwt.io


## OAuth2


## Inbound credential management
- Prefer certificates
- TODO - salt, etc.

## Outbound credential management
- Outbound passwords must not be stored in clear-text. Outbound passwords must be stored in a secure vault.




# Threats

## Cross-origin resource sharing (CORS)


## Cross-site request forgery (CSRF)


## Cross-site scripting (XSS)


## SQL-Injection

## Denial-of-Service (DoS/DDoS)
- Inbound request handling should separate message receipt from message processing.  The lightweight receipt (recognition, validation, persistence) are he only functions that happens synchronously, and the more heavy processing (transformation) is handled asynchronously after having waited in a work queue.
- The response for such requests should be "HTTP 201 Accepted" - indicating the message has been successfully received, but not yet processed.






