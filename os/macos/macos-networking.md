



# dns

```bash
# flush dns cache
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder

# dns lookup
see 'network/dns/dns.md'
```

# icloud

```bash
# monitor icloud sync behavior
brctl log --wait --shorten          # --wait option no longer exists as of...
brctl log -w --shorten              # 2020 Catalina and later
```

# speed test

```bash
networkQuality      # run speed test (parallel)
networkQuality -s   # run speed test (serial)
```

# wifi

```bash
# Show Available WiFi Networks
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s

# Get information about current WiFi connection
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I
```

