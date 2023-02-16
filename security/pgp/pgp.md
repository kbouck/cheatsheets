# key management

```bash
# export public key
gpg --output public.pgp --armor --export username@email

# export private key
gpg --output private.pgp --armor --export-secret-key username@email
gpg --output backupkeys.pgp --armor --export-secret-keys --export-options export-backup user@email

# import private or public key
gpg --import private.pgp
gpg --import public.pgp
```

# encrypt, decrypt

```bash
# decrypt
gpg --output doc --decrypt doc.gpg
```





# todo

```bash

# Encrypt file symmetrically (creates <file>.gpg and do _not_ removes the
# original: shred recommended)
gpg -c <file>
# With specified cipher and disabled passphrase caching
gpg -c --cipher-algo 'AES256' --no-symkey-cache a.txt
# Encrypt file asymmetrically
gpg -e --default-recipient-self <file>
# As ASCII and output to the STDOUT
gpg -e --default-recipient-self -a --output - <file>

# Decrypt file
gpg -d <file>

# Generate a new secret key
gpg --full-gen-key

# List secret keys in the keyring
gpg -K
# List public keys in the keyring
gpg -k

# Export the public key in ASCII format
gpg --export --armor <user-id> >public.key
# Import the public key
gpg --import public.key

# Change the expiration period of the key
gpg --edit-key <user-id>
> expire

# Sign a file
gpg -s <file>
# Verify the signature
gpg --verify <file>.gpg

```

