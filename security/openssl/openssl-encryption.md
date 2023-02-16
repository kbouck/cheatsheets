



# ciphers

```bash
# cipher suites
openssl ciphers
openssl ciphers -v

# cipher algorithms
openssl list -cipher-algorithms

```

# symmetric key encryption

```bash
openssl enc -ciphername 
[-AadePp] 
[-base64] 
[-bufsize number] 
[-debug] 
[-in file] 
[-iv IV] 
[-K key] 
[-k password] 
[-kfile file] 
[-md digest] 
[-none] 
[-nopad] 
[-nosalt] 
[-out file] 
[-pass arg] 
[-S salt]
[-salt]


# encrypt
# - will prompt for a password
openssl enc -e -aes-256-cbc \
  -salt \
  -pbkdf2 \
  -iter 1000000 \
  -md sha512 \
  -base64 \
  -in somefile \
  -out somefile.enc # to encrypt

# decrypt
# - will prompt for a password
openssl enc -d -aes-256-cbc \
  -salt \
  -pbkdf2 \
  -iter 1000000 \
  -md sha512 \
  -base64 \
  -in somefile.enc \
  -out somefile # to decrypt
```

