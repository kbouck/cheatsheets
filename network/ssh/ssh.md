

# cheatsheet

```bash
-p <port>               # use custom ssh port (other than 22)


ssh ... 'some command'  # run command, return stdout
```





# key generation

```bash

ssh-keygen -t ed25519 -C "kevin.bouck@gmail.com"         # Ed25519 algorithm
ssh-keygen -t rsa -b 4096 -C "kevin.bouck@gmail.com"    # RSA algorithm



```



# ssh-agent

- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

```bash
# start agent in background
eval "$(ssh-agent -s)"

# create or modify ~/.ssh/config
open ~/.ssh/config

Host *                                # maybe use github.com instead of *?
  AddKeysToAgent yes
  UseKeychain yes                     # only needed if key has a passphrase
  IdentityFile ~/.ssh/id_ed25519

# add key to ssh-agent and store passphrase in keychain 
ssh-add -K ~/.ssh/id_ed25519




```

