

# dig

```bash

dig <host>                                      # basic query (queries A records)
dig +short ...                                  # terse responses
dig +short -x <ip-address>                      # reverse lookup (ip-to-name)

# query by record type
dig A <host>                                    # query for A records
dig AAAA <host>                                 # query for AAAA records
dig MX <host>                                   # query for MX records
dig CNAME <host>                                # query for CNAME records

dig @192.168.1.1 <host>                         # query a specific name server
```

# dns cache

```bash
# flush dns cache
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder   # flush DNS cache (macOS)
```


# dns record types

Reference:

- https://en.wikipedia.org/wiki/DNSBL
- https://en.wikipedia.org/wiki/Subnet_mask
- https://en.wikipedia.org/wiki/Message_transfer_agent

```bash
abbv.   record type
=====   ============       
A       ipv4 address             # Returns (32-bit) ipv4 address used to map hostnames to IPs, 
                                 # but also used for DNSBLs and storing subnet masks
AAAA    ipv6 address             # Returns ipv6 address
ANAME   non-standard alias       
CNAME   canonical name           # Alias for an exact name. DNS lookup will retry lookup with new name.
DNAME   delegation name          # Alias for a name and all subtree/subnames. DNS lookup will retry lookup with new name.
MX      mail exchange            # Maps a domain name to a preference-ordered list of mail servers for that domain
SRV
PTR
TXT
HTTPS 
```

# pseudo-TLDs 

```bash
.local        # mDNS, Apple
.lan          # popular, short, likey
.localdomain  # seems to be default in some network products
.home         # - dont use, as .home is now an internet TLD
.fritz.box    # Probably not good as ICANN delegated .box in 2016
```


# protocol
- https://www.plixer.com/blog/overview-of-dns-protocol-part-1-of-3/



# security

## DNSCrypt

TODO

## DNS-over-TLS

TODO

