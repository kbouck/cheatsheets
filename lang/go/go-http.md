

```go

resp, err := http.Get(url)

```







```go


// Fetch retrieves the comic as per provided comic number
func (hc *XKCDClient) Fetch(n ComicNumber, save bool) (model.Comic, error) {
    resp, err := hc.client.Get(hc.buildURL(n))
    if err != nil {
        return model.Comic{}, err
    }
    defer resp.Body.Close()

    var comicResp model.ComicResponse
    if err := json.NewDecoder(resp.Body).Decode(&comicResp); err != nil {
        return model.Comic{}, err
    }

    if save {
        if err := hc.SaveToDisk(comicResp.Img, "."); err != nil {
            fmt.Println("Failed to save image!")
        }
    }
    return comicResp.Comic(), nil
}

```


```go
Fetch from API using the XKCDClient
comic, err := xkcdClient.Fetch(client.ComicNumber(*comicNo), *saveImage)
if err != nil {
    log.Println(err)
}
```
