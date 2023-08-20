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

USAGE: networkQuality [-C <configuration_url>] [-c] [-h] [-I <network interface name>] [-k] [-p] [-r host] [-s] [-v]
    -C: override Configuration URL or path (with scheme file://)
    -c: Produce computer-readable output
    -h: Show help (this message)
    -I: Bind test to interface (e.g., en0, pdp_ip0,...)
    -k: Disable certificate validation
    -p: Use Private Relay
    -r: Connect to host or IP, overriding DNS for initial config request
    -s: Run tests sequentially instead of parallel upload/download
    -v: Verbose output

# default config

{ "version": 1,
  "test_endpoint": "uklon6-edge-bx-031.aaplimg.com",
  "urls": {
      "small_https_download_url": "https://mensura.cdn-apple.com/api/v1/gm/small",
      "large_https_download_url": "https://mensura.cdn-apple.com/api/v1/gm/large",
      "https_upload_url": "https://mensura.cdn-apple.com/api/v1/gm/slurp",
      "small_download_url": "https://mensura.cdn-apple.com/api/v1/gm/small",
      "large_download_url": "https://mensura.cdn-apple.com/api/v1/gm/large",
      "upload_url": "https://mensura.cdn-apple.com/api/v1/gm/slurp"
   }
}


```

# wifi

```bash
# wifi details
- Hold ALT when clicking wifi in menu bar for more details 

# Show Available WiFi Networks
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s

# Get information about current WiFi connection
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I
```

