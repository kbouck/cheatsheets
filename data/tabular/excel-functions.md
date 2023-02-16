Excel Functions


# VLOOKUP

    VLOOKUP(lookup_value, table_range, col_index_num, [range_lookup])


    range_lookup == FALSE // 



MATCH+INDEX

```ruby
# MATCH+INDEX

MATCH(lookup_value, lookup_array)     # looks for a value in an array, and returns the index number
MATCH(A2, LOOKUP!A:A)

INDEX(array, row_num)                 # returns the array value at a given index


# Together:
# Lookup value in LOOKUP!B, from row where LOOKUP!A = A2
INDEX(LOOKUP!B:B, MATCH(A2, LOOKUP!:A:A))
```





## Regex

```excel
=RegexExtract(A1,"gi[|](\d+)[|]")
```



```visual basic
Function RegexExtract(ByVal text As String, _
                      ByVal extract_what As String, _
                      Optional separator As String = ", ") As String

Dim allMatches As Object
Dim RE As Object
Set RE = CreateObject("vbscript.regexp")
Dim i As Long, j As Long
Dim result As String

RE.pattern = extract_what
RE.Global = True
Set allMatches = RE.Execute(text)

For i = 0 To allMatches.count - 1
    For j = 0 To allMatches.Item(i).submatches.count - 1
        result = result & (separator & allMatches.Item(i).submatches.Item(j))
    Next
Next

If Len(result) <> 0 Then
    result = Right$(result, Len(result) - Len(separator))
End If

RegexExtract = result

End Function
```

