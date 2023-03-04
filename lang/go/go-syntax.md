

# comments

```go
// single-line comment

/*
multiline commment
*/
```

# documentation

```go
go doc fmt                   # info about fmt package
go doc fmt.println           # info about fmt.Println function
```

# variables

```go
var fruit string                         // variable declaration (explicit type)
fruit = "apple"                          // variable assignment
var fruit string = "apple"               // variable declaration and assignment (explcit type)
var fruit = "apple"                      // variable declaration and assignment (implicit type)
fruit := "apple"                         // variable declaration and assignment (implcit type)
var x, y int = -1, 5                     // multiple variable declaration and assignment (explicit type)
a, b := 7, 2                             // multiple variable declaration and assignment (implicit type)
var a, b = "A", 1                        // multiple variable declaration and assignment (differing implicit types)
found, answer := true, "yes"             // multiple variable declaration and assignment (differing implicit types)
if a := 1; a >= 1 { ... }                // short variable declaration (if)
switch a := "b"; season { ... }          // short variable declaration (switch)

// variable block
var (
    Month = time.Now().Month()
    Year = time.Now().Year()
)

// zero values
// When initialized without an assignment, a variable is set to the 'zero value' for it's type:
int      0
float    0
string   ""       // empty string
boolean  false
```

# constants

```go
const Pi = 3.14                          // constant declaration
const name, size = "carrot", 100         // multiple constant declaration
const v int16 = 10                       // typed constant

// constant block
const (
	BaseURL string = "https://xkcd.com"
	DefaultClientTimeout time.Duration = 30 * time.Second
	LatestComic ComicNumber = 0
)

// iota
// - enumerator starting at 0 whose value is determined at compile-time, not at run-time!

// constant block with iota
const (
    Low = 5 * iota                      // 0
    Medium                              // 5
    High                                // 10     
)
```

# types

## string

```go
fmt.Println(a + " " + b)
```

## bool

```go
```



## int

```go
score := 85                   // inferred type: int
var temperature = 60          // inferred type: int 

// other int types
int, int8, uint8, int16, uint16, int32 , uint32, int64, uint64, uint, uintptr
```

## float32, float64

```go
float32
float64
```

## complex64, complex128

```go
```

## pointer

```go
*int                                     // pointer
&a                                       // variable address
var b *int = &a                          // assign variable address of a to pointer b
*b = 5                                   // assign variable pointed to by pointer b
```

## slice

- like arrays, but dynamic size
- when passed as f(n) param, is passed by reference

```go
var slice []int                                  // declare empty slice
names := []string{"a", "b", "c", "d"}            // declare and initialize slice
slice := append(slice, newElement)               // append to end of slice
len := len(slice)                                // slice length
capacity := cap(slice)                           // slice capacity
```

## array

- like slice, but fixed size
- when passed as f(n) param, is passed by value, so changes inside f(n) have no effect outside f(n)
  - so, declare param as slice for changes in f(n) to affect array values   

```go
var array [4]int                                 // declare empty array
array := [4]string{"a", "b", "c", "d"}           // declare and assign array
array := [...]string{"a", "b", "c", "d"}         // declare and assign array (implicit length)
value := array[index]                            // access array element
array[index] = value                             // modify array element
length := len(array)                             // array length
```

## map

- unordered collection of key-value pairs

```go
variableName := make(map[keyType]valueType)      // create empty map

variableName := map[keyType]valueType{           // initialize map
    key1, value1,
    key2, value2,
    key3, value3,
}

value := some_map[key]                            // access map entry
value,found := some_map[key]                      // access map entry, also return whether entry was found
some_map[key] = value                             // add or change entry
delete(some_map, key)                             // delete entry
```

## struct

```go
// struct
type Point struct{                                // struct definition
        x int                                     // field
        y int                                     // field
}

// nested struct
type Rectangle struct{
        point1 Point                              // fields can be other structs
        point2 Point                              
}

// struct methods
func (rectangle Rectangle) area()  float32{       // define struct method
        return rectangle.length * rectangle.height
}

// as function params
// struct value only modifiable in function if passed as pointer
func (rectangle *Rectangle) modify(newLength float32){
        rectangle.length = newLength
}

// construction, interaction
p1 := Point{x: 10, y: 12}                         // create struct instance
p1.x                                              // access struct field value
rect.area()                                       // invoke struct method
```

# operators

```go
// assignment operators
=            // assign
:=           // assign without 'var' keyword
+=           // modify variable by addition              
-=           // modify variable by subtraction
*=           // modify variable by multiplication
/=           // modify variable by division

// comparison operators
==           // equivalence operator
!=           // not equal
<            // less than
>            // greater than
<=           // less than or equal
>=           // greater than or equal

// logical operators
&&           // and
||           // or
!            // not
```

# control

## if /  else

```go
if (condition) { ... }
if (condition) { ... } else { ... }
if (condition1) { ...} else if (condition2) { ... } else { ... }
```

## loops

```go
for i := 0; i < 10; i++ { ... }           // definite loop
for condition { ... }                     // indefinite loop
for { ... }                               // infinite loop (while-true)
break                                     // break out of entire loop
continue                                  // jump to next loop iteration
for i, value := range some_array { ... }  // loop over array elements

// range
// - todo
```

## switch

```go
switch some_var {
  case "a":
    // ...
  case "b":
    // ...
  case "c":
    // ...
  default:
    // ...
}
```

# threads

## goroutines

- lightweight thread 

```go
go f(x, y z)                  // start goroutine
```

## channels

```go
ch := make(chan int)          // create channel (not buffered)
ch := make(chan int, 100)     // create channel (buffer length 100)
ch <- v                       // Send v to channel ch.
v := <-ch                     // Receive from ch, assign to v.
v, ok := <-ch                 // Receive from ch, assign to v. also test if channel closed
for i := range ch             // iterate over channel (continues until channel closed)
close(ch)                     // close channel

// select
select {                      // block until one of the cases is ready to run
    case c <- x:
        x, y = y, x+y
    case <-quit:
        fmt.Println("quit")
        return
    default:                  // run this if no blocks ready, blocks if no default and no other blocks are ready
        ...
}
```

# random

```go
rand.Seed(time.Now().UnixNano())       // seed random number generator
number := math.rand.Intn(100)          // random number 0-99
```

# functions

```go
func makeMeOlder(age int) { ... }
```

