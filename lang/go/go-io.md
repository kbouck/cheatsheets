

# output

## string print

```go
import "fmt"
fmt.Print("Hello", "World")
fmt.Println("Hello", "World")
fmt.Printf("My name is %v", name)
```

## string format

```go
%v      // named value's default format
%d      // named value expected to be an integer
%f      // named value expected to be a float
%T      // named value's type
```

# input

## scan

```go
var number int
fmt.Println("What is your favorite number?")
fmt.Scan(&number)
```



# files



```go
// paths
filepath.Abs(savePath)
path.Base(url)

// file operations
os.Create(filePath)
io.Copy(file, resp.Body)


```





todo

```
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

