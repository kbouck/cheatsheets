

```go
comicNo := flag.Int(
    "n", int(client.LatestComic), "Comic number to fetch (default latest)",
)
clientTimeout := flag.Int64(
    "t", int64(client.DefaultClientTimeout.Seconds()), "Client timeout in seconds",
)
saveImage := flag.Bool(
    "s", false, "Save image to current directory",
)
outputType := flag.String(
    "o", "text", "Print output in format: text/json",
)
flag.Parse()

```

See Also
- https://github.com/spf13/cobra (cli)
- https://github.com/spf13/viper (config)
- https://github.com/integrii/flaggy (cli flags)
