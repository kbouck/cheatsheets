

https://www.plixer.com/blog/overview-of-dns-protocol-part-1-of-3/




# DNS Record Types

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

# pseudo TLD 

(.local, .lan, .home, .localdomain)

```bash
.local        # mDNS, Apple
.lan          # popular, short, likey
.localdomain  # seems to be default in some network products
.home         # - dont use, as .home is now an internet TLD
.fritz.box    # Probably not good as ICANN delegated .box in 2016
```



# DNS-over-TLS
TODO

# DNSCrypt
TODO


