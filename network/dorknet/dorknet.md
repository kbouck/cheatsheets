
# hosts and IPs

```python
# range              purpose
192.168.1.[1-9]	     Primary Network Devices (gateway, dns, dhcp)
192.168.1.[10-19]	   Switches
192.168.1.[20-29]	   Wireless Access Points
192.168.1.[30-49]	   Network Services (Video, Shares, Storage SAN/NAS)
192.168.1.[50-99]	   Fixed IP Range
192.168.1.[100-199]	 Dynamic IP (DHCP) Range
192.168.1.[200-250]	 IoT Devices

# ISP - XS4ALL
194.109.5.226    ISP gateway
194.109.6.66     ISP DNS
194.109.9.99     ISP DNS
dr15.d12         Broadband PoP

# ISP - KPN
195.190.228.115  ISP Gateway
77.174.73.157    my public IP

# netmask
192.168.1.0/24                             # /24 is CIDR representation for netmask 255.255.255.0

# primary [1..9]
192.168.178.1    fritz-box                 # DSL modem / gateway (Fritz!Box 7583?)
192.168.1.1      unifi-gateway             # gateway, dns (default)
192.168.1.2      pi-hole                   # dns (adblock)

# switches [10..19]
192.168.1.10     unifi-switch-downstairs
192.168.1.11     unifi-switch-upstairs
192.168.1.12     unifi-switch-tv
192.168.1.13     unifi-switch-downstairs-mini
192.168.1.14     unifi-switch-kitchen  (future)
192.168.1.15     unifi-switch-office   (future)

# access points [20..29]
192.168.1.20     unifi-ap-downstairs
192.168.1.21     unifi-ap-upstairs
192.168.1.22     unifi-ap-bedroom
192.168.1.23     unifi-ap-kitchen     (future)

# network services [30..49]  (would dns belong in here?) 
192.168.1.30     nas (lan) 1 / network storage
192.168.1.31     nas (lan) 2 / network storage

# servers
192.168.1.40     pi                        # unifi controller / grafana / etc 
192.168.1.41     mini-server               #  
192.168.1.42     pi-utility
192.168.1.43     pi-door
192.168.1.44     pi-cat


# fixed-ip clients [50..99]
192.168.1.50     laptop-akzo
192.168.1.51     mini             # maybe is a server? yes.
                 laptop-cisco
                 apple-tv         # why fixed?
                 samsung-tv       # why fixed?
                 formuler-tv      #
192.168.1.36     yamaha-av                 # (remove: no need for fixed ip)


# iot (todo different vlan?)
192.168.2.x
192.168.1.60     hue-bridge-downstairs
192.168.1.61     hue-bridge-upstairs
                 cams



        
# DHCP





# optional client manual dns config
192.168.1.2    # for ad-blocking dns (pi-hole)
192.168.1.1    # for non-ad-blocking
1.1.1.1        # for internet dns (cloudflare)

```



wifi

```bash
# 5GHz
- Everything except for the 2.4 clients below

# 2.4 GHz Clients
- Withings scale
- Anova Cooker
- Miele Washing Machine
- Mitsubishi AC wall units
- Pi <=3.x and Pi Zero

```







VLAN

```bash
TODO




IoT

# Firewall rules
- Allow all traffic from native VLAN to IoT VLAN
- Allow UDP 53 from IoT to DNS servers
- Drop all other IoT traffic
- DHCP (todo)






```



# unifi

```bash
# gateway logs
show log                            # general logging
show vpn log                        # IPsec VPN log
/var/log/freeradius/radius.log
/var/log/dnsmasq.log                # DNSmasq
/var/log/suricata/suricata.log      # IPS/IDS Engine Logging
/var/log/messages

# AP's and switches
/var/log/messages


# controller
- see unifi-controller @ 'dorknet-services.md'



# todo 
/usr/lib/unifi/logs/ 




```

