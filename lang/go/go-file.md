```go

// SaveToDisk downloads and saves the comic locally
func (hc *XKCDClient) SaveToDisk(url, savePath string) error {
    resp, err := http.Get(url)
    if err != nil {
        return err
    }
    defer resp.Body.Close()

    absSavePath, _ := filepath.Abs(savePath)
    filePath := fmt.Sprintf("%s/%s", absSavePath, path.Base(url))

    file, err := os.Create(filePath)
    if err != nil {
        return err
    }
    defer file.Close()

    _, err = io.Copy(file, resp.Body)
    if err != nil {
        return err
    }
    return nil
}
```
