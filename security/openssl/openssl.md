



# LibreSSL vs openssl

The macOS default openssl is LibreSSL which does not support pbkdf2.

To find out if you are using LibreSSL run: 

```bash
openssl version
```

To upgrade to openssl:

```bash
$ brew update
$ brew install openssl

# if it is already installed, update it:
$ brew upgrade openssl@1.1

# The last step is to ensure that it is in your path before the default:
echo 'export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"' >> ~/.bash_profile
```

