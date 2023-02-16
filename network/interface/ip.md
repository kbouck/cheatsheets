



# cheatsheet

```bash
# general
ip addr                                  # display all interfaces with addresses
ip link set dev wlan0 {up|down}          # take down / up the wireless adapter
ip addr add 192.168.1.100/32 dev eth0    # add an interface IP and netmask (CIDR)
ip addr del 192.168.1.100/32 dev eth0    # remove an interface IP (CIDR)
ip address flush dev eth0                # remove all interface IPs

# routing
ip route                                 # display all routes
ip -6 route                              # display all routes (ipv6)
ip route add default via <gateway-ip>    # add default route via gateway IP
ip route add 192.168.0.0/24 dev eth0     # add route via interface
ip route get to <ip-addr>                # show route used to reach a given IP

# mac/arp
ip link set dev eth0 address <mac-addr>  # change your mac address
ip neighbor show                         # view neighbors (using ARP and NDP)
```

