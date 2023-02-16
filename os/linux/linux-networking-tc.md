


show

ingress
egress

dual-dsthost
dual-srchost

nat
nonat


# Shaping Traffic

- cake
- essential to identify what interfaces to specify for in/out
- took some fiddling to find best bandwidth options to specify
- no idea what all those other options do

```bash
# Shape download
/usr/sbin/tc qdisc add dev eth2 handle 1: root cake besteffort bandwidth 200mbit internet ingress dual-dsthost ethernet

# Shape upload
/usr/sbin/tc qdisc add dev vlan1 handle 1: root cake besteffort bandwidth 20mbit internet egress dual-srchost ethernet

```



cat /etc/config/sqm
tc -d qdisc
tc -s qdisc



