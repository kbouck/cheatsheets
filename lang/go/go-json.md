
convert json to go struct: 
- https://mholt.github.io/json-to-go/


```go
type Comic struct {
	Title       string `json:"title"`
	Number      int    `json:"number"`
	Date        string `json:"date"`
	Description string `json:"description"`
	Image       string `json:"image"`
}
```

```go
type ComicResponse struct {
	Month      string `json:"month"`
	Num        int    `json:"num"`
	Link       string `json:"link"`
	Year       string `json:"year"`
	News       string `json:"news"`
	SafeTitle  string `json:"safe_title"`
	Transcript string `json:"transcript"`
	Alt        string `json:"alt"`
	Img        string `json:"img"`
	Title      string `json:"title"`
	Day        string `json:"day"`
}
```


```go
// JSON converts the Comic struct to JSON, we'll use the JSON string as output
func (c Comic) JSON() string {
	cJSON, err := json.Marshal(c)
	if err != nil {
		return ""
	}
	return string(cJSON)
}
```

