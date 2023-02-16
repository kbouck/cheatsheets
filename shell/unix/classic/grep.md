

## one-liners

```bash
grep -Ev '^\s*$'               # filter out empty lines
grep -Ev '^\s*$|^\s*\#'        # filter out comments
grep -Ev '^\s*$|^\s*\#'        # filter out empty lines and comments
```



## options

```bash
-i      # ignore case
-n      # display line numbers
-v      # inverse, print lines that do NOT match
-c      # print count of line matches
-A<n>   # print n lines after match
-B<n>   # print n lines before match
-C<n>   # print n lines before and after match 
-o      # print only the matched expression, not whole linle
-E      # extended regular expressions
--line-buffered # force line buffering
--color # colorize match
```

# grep type
```bash
grep  = grep -G # Basic Regular Expression (BRE)
fgrep = grep -F # fixed text, ignoring meta-charachetrs
egrep = grep -E # Extended Regular Expression (ERE)
pgrep = grep -P # Perl Compatible Regular Expressions (PCRE)
rgrep = grep -r # recursive
```

## extended regular expressions

- egrep or grep -E

```bash
*      # zero or more occurrences
+      # one or more occurrences
?      # zero or one occurrences
|      # delimiter for multiple patterns
()     # group patterns
{}     # range of occurrences
```



