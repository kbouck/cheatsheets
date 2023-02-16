

# dig

```bash

dig +short ...                                  # terse responses
dig +short CNAME www.covidtests.gov             # CNAME query
dig +short covidtests.gov                       # A record query
dig +short -x <ip-address>                      # reverse lookup (ip-to-name)

dig @192.168.1.1 ...                            # use a specific name server
```




# Record Types

Reference:

- https://en.wikipedia.org/wiki/DNSBL
- https://en.wikipedia.org/wiki/Subnet_mask
- https://en.wikipedia.org/wiki/Message_transfer_agent

```bash
A       ipv4 address record      # Returns (32-bit) ipv4 address used to map hostnames to IPs, 
                                 # but also used for DNSBLs and storing subnet masks
AAAA    ipv6 address record      # Returns ipv6 address
ANAME   non-standard alias       
CNAME   canonical name record    # Alias for an exact name. DNS lookup will retry lookup with new name.
DNAME   delegation name record   # Alias for a name and all subtree/subnames. DNS lookup will retry lookup with new name.
MX      mail exchange record     # Maps a domain name to a preference-ordered list of mail servers for that domain
SRV
PTR
TXT
HTTPS 
```

# Pseudo TLDs 

```bash
.local        # mDNS, Apple
.lan          # popular, short, likey
.localdomain  # seems to be default in some network products
.home         # - dont use, as .home is now an internet TLD
.fritz.box    # Probably not good as ICANN delegated .box in 2016
```


# Protocol
- https://www.plixer.com/blog/overview-of-dns-protocol-part-1-of-3/


# DNS-over-TLS
TODO

# DNSCrypt
TODO


