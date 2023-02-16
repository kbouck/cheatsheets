
# S/MIME

The smime command handles S/MIME mail. It can encrypt, decrypt, sign and verify S/MIME messages.

`openssl cms` (also the earlier and less capable `smime`) uses internal routines that implement SMIME format only for Content-transfer-encoding: base64 and **don't support Content-transfer-encoding: binary**. FWIW these are [documented](https://www.openssl.org/docs/manmaster/crypto/SMIME_read_PKCS7.html) [as bugs](https://www.openssl.org/docs/manmaster/crypto/SMIME_read_CMS.html), so might someday get fixed.



Reference:

https://www.freecodecamp.org/news/how-to-decrypt-an-as2-message-smime-with-openssl-d47fda5fd7db/



## Decrypt S/MIME

```bash
openssl smime -decrypt -in base64_message_with_headers.raw -recip cert.pem -inkey private_key.pem >> decrypted_message.txt
```



Please refer detail at: http://www.openssl.org/docs/apps/smime.html

## View the Signature in an SMIME document

To view the S/MIME signature:
(smime.txt is a saved SMIME email message, and the command output follows)

```bash
openssl smime -pk7out -in smime.txt | openssl pkcs7 -text -noout -print_certs


```

This will output something like:

```
Certificate:
    Data:
        Version: 1 (0x0)
        Serial Number: 1115360292 (0x427b0c24)
        Signature Algorithm: sha1WithRSAEncryption
        Issuer: CN=Meica
        Validity
            Not Before: May  6 06:18:12 2005 GMT
            Not After : May  6 06:18:12 2006 GMT
        Subject: CN=Meica
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
            RSA Public Key: (1024 bit)
                Modulus (1024 bit):
                    00:d9:99:12:5c:fa:6f:ec:ec:64:b6:99:75:43:19:
                    c6:a3:5c:8b:04:62:3c:67:40:db:ba:35:3e:25:31:
                    5a:b0:4b:0e:e4:7c:bd:ba:b7:83:30:f6:83:b0:1f:
                    59:47:9e:97:1e:c5:99:8c:3e:4c:11:8d:86:2e:1b:
                    30:0a:ab:9f:a5:49:a6:8e:02:af:cf:85:52:55:3c:
                    92:f1:a9:ab:68:bc:63:26:9f:82:e6:1d:21:70:ba:
                    3b:72:51:4d:90:24:51:5e:0c:5e:66:0e:c0:65:9d:
                    43:a1:49:66:33:a8:a9:7f:b6:85:d5:76:7d:52:78:
                    aa:93:dd:56:54:5c:9f:e5:37
                Exponent: 65537 (0x10001)
    Signature Algorithm: sha1WithRSAEncryption
        89:45:13:98:c1:98:3c:40:de:06:f9:94:c2:3d:d4:aa:68:ce:
        14:e8:d1:f2:07:6d:10:9d:b8:7d:6f:8c:d3:dc:76:12:7a:7b:
        ae:57:6b:06:47:6f:c9:be:2d:74:26:7c:dd:09:b5:42:bd:24:
        f6:7a:25:0d:30:99:1b:58:0f:69:53:d1:e3:c0:a8:39:ed:3b:
        54:e6:3f:2b:d6:f6:99:4f:f1:1c:21:69:6e:33:de:32:fb:ab:
        fe:a6:af:4a:ff:fb:57:04:bb:de:b9:e5:2e:90:3d:23:8c:31:
        17:32:c6:95:50:3f:59:1c:7b:86:d8:d1:f0:26:cd:f4:e0:9f:
        d6:15
```



## Decrypt

```bash
openssl cms -decrypt -in ediintdata.der -inform DER -recip recipient_cert.pem -inkey recipient_key.pem 
```



## Verify

Here use the signed MDN as example of SMIME document.

Let's assume the MDN is signed by demo sender certificates provided from webMethods EDIINT Module. The sender certificates can be found under \IntegrationServer\packages\WmEDIINT\pub\demo.

Since the MDN doesn't contain te certificated infromation, the certificates have to be loaded into openssl trusted directory.

Here are steps:

Go to TN console to copy the signed MDN and save it as file under file directory. In this example, we call it mymdn.
Extract the first certificate from senderCert.der and save it as different der file which it is called senderRoot.der in this example.
Then use openSSL commend to convert sender certificates and public key files from der to pem files e.g. senderRoot.der, senderCACert.der and senderCert.der using command as:

```bash
openssl x509 -in senderRoot.der -inform DER -out senderRoot.pem -outform PEM
```

Then make sender certificates and public key are trusted by openSSL using command as 

```bash
openssl x509 -in senderRoot.pem -addtrust serverAuth
```

senderRoot.pem is the certificate you want to put in the trust directory.

Put all sender pem files under openSSL trust directory. Please refer OpenSSL to find out openSSL trusted directory.
Then run the following command to verify the signature:

```bash
openssl smime -verify -CApath C:\OpenSSL\bin\PEM\ -CAfile C:\OpenSSL\bin\PEM\senderFirstPath.pem -certfile C:\OpenSSL\bin\PEM\senderCert.pem -signer C:\OpenSSL\bin\PEM\senderCACert.pem -in c:\mymdn
```

Configuration
OpenSSL Trusted Directory
When OpenSSL was built for your system, it was configured with a “Directory for OpenSSL files.” (That's the --openssldir option passed to the configure script, for you hands-on types.) This is the directory that typically holds information about certificate authorities your system trusts.

The trick to find the trusted directory is to find the cert.pem file. Within that directory and a subdirectory called certs, you're likely to find one or more of three different kinds of files.

A large file called cert.pem, an omnibus collection of many certificates from recognized certificate authorities like VeriSign and Thawte.
Some small files in the certs subdirectory named with a .pem file extension, each of which contains a certificate from a single CA.
Some symlinks in the certs subdirectory with obscure filenames like 052eae11.0. There is typically one of these links for each .pem file.



## Convert raw EDIINT message to DER format

```
cat ediintdata | sed '1,/^\r$/d' > ediintdata.der 
```

## Finding out the Encryption Algorithm Used

```bash
openssl asn1parse -i -inform der -in message.raw
```

NOTE: This command assumed input is now in DER format (see above)

The output would be as follows. If you can see below, there are roughly two main parts shown here in [ASN.1 notation](https://en.wikipedia.org/wiki/Abstract_Syntax_Notation_One) as **pkcs7-envelopedData** part and **pkcs7-data** part. In pkcs7-data part, we have **‘des-ede3-cbc’** which is the encryption algorithm used.



## Finding the Public Key used for encryption

```bash
openssl asn1parse -i -inform der -in message.raw
```

NOTE: This command assumed input is now in DER format (see above)

If you look at the **asn1parse output** above, you should see that we have **commonName**, **organizationName** etc in **pkcs7-envelopedData** section. These are the details on the certificate used to encrypt the AS2 payload.

Now after the **countryName** entry, you might see a line as follows.

**122:d=9 hl=2 l= 4 prim: PRINTABLESTRING :None**
**128:d=6 hl=2 l= 6 prim: INTEGER :01627AE13D2D**

This is the certificate serial in hex and with this, you can verify if the correct public has been used during the encryption.





