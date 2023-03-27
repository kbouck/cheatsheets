

# cheatsheet

- TODO: add any goodies from: http://cht.sh/openssl

```bash
# hash
<data> | openssl sha256                                      # generate sha-256 hash of data

# private key
openssl genrsa -out priv_key.pem 2048                        # generate 2048-bit private key
openssl rsa -in priv_key.pem -out priv_key.der -outform der  # convert key PEM -> DER
openssl rsa -in priv_key.der -inform der -out priv_key.pem   # convert key DER -> PEM
openssl pkcs8 -inform pem -nocrypt -in priv_key_pk8.pem \
        -out priv_key_rsa.pem                                # convert key PKCS8 to RSA

# certificate signing request
openssl req -new -key key.pem -out csr.pem                   # create csr interactively (use existing key)
openssl req -newkey rsa:2048 -keyout key.pem -out csr.pem    # create csr interactively (generate key)
openssl req -in csr.pem -text -noout                         # view csr

# certificate
openssl x509 -in cert.pem -text -noout                       # view PEM-format cert
openssl x509 -in cert.der -inform der -text -noout           # view DER-format cert
openssl x509 -in cert.pem -purpose -noout                    # view cert purpose(s)
openssl x509 -in cert.pem -out cert.der -outform der         # convert cert PEM -> DER
openssl x509 -in cert.der -inform der -out cert.pem          # convert cert DER -> PEM
openssl x509 -req -days 360 -in csr.pem \
        -signkey priv_key.pem -out cert.pem                  # sign certificate

# create self-signed cert
openssl genrsa -out priv_key.pem 2048                        # generate 2048-bit private key
openssl req -new -key key.pem -out csr.pem                   # create csr interactively (use existing key)
openssl x509 -req -days 360 -in csr.pem \
        -signkey priv_key.pem -out cert.pem                  # sign

openssl req -nodes -newkey rsa:2048 -keyout private.key -out CSR.csr -subj "/C=NL/ST=Zuid Holland/L=Amsterdam/O=Sparkling Network/OU=IT Department/CN=ssl.raymii.org"

# keystore (pkcs12)
openssl pkcs12 -in keystore.p12 -nokeys                      # view pkcs12 keystore contents (certs only)
openssl pkcs12 -export -in keystore.pem -out keystore.p12    # convert keystore format PEM -> pkcs12
openssl pkcs12 -in keystore.p12 -clcerts -nokeys             # get client certs from pkcs12 keystore
openssl pkcs12 -in keystore.p12 -cacerts -nokeys             # get CA certs from pkcs12 keystore
openssl pkcs12 -in keystore.p12 -nocerts -nodes              # get private key from pkcs12 keystore
openssl pkcs12 -export -in cert.pem -inkey priv_key.pem \ 
        -CAfile ca.pem -name "server" -out server.p12        # add cert and private key to pkcs12 keystore


# verify
openssl verify -verbose -CAfile root.pem cert.pem            # verify 2-level cert chain
cat root.pem int1.pem int2.pem > combined.pem                # concatenate root and intermediate certs (in order)
openssl verify -verbose -CAfile combined.pem cert.pem        # verify n-level cert chain
openssl verify -verbose -CAfile <(cat a b c) cert.pem        # verify n-level cert chain (one-liner)

# asn.1
openssl asn1parse -in priv_key.pem                           # show asn.1 structure of private key (pem)
openssl asn1parse -in priv_key.der -inform der               # show asn.1 structure of private key (der)
openssl asn1parse -in cert.pem                               # show asn.1 structure of cert (pem)
openssl asn1parse -in cert.pem -inform der                   # show asn.1 structure of cert (der)

# test for match
diff <(openssl pkey -pubout -in priv_key.pem) \
     <(openssl x509 -pubkey -in cert.pem -noout)             # test key and cert match
openssl x509 -in cert.pem -modulus -noout                    # get cert modulus
openssl rsa -in priv_key.pem -modulus -noout                 # get private key modulus
diff <(openssl x509 -in cert.pem -modulus -noout) \
     <(openssl rsa -in priv_key.pem -modulus -noout)         # compare key and cert modulus 
     
# see also
keytool
```



# private key

```bash
# generate private key (PEM-format)
openssl genrsa -out private_key.pem 2048                       # generate 2048-bit private key
openssl genrsa -out private_key.pem 2048 -des3                 # todo - password protect key
openssl genrsa -out private_key.pem 2048 -rand <some-file>     # todo - add entropy
openssl rsa -in key.pem -inform PEM -out key.der -outform DER  # convert key PEM -> DER
openssl rsa -in key.der -inform DER -out key.pem -outform PEM  # convert key DER -> PEM
openssl pkcs8 -inform PEM -nocrypt -in key_pk8.pem -out key_rsa.pem # convert key PKCS8 to RSA





# convert rom PEM-PKCS8 to PEM-RSA:
# A PEM-formatted PKCS8 private key will begin like this:
#    -----BEGIN PRIVATE KEY-----
# A PEM-formatted RSA private key will begin like this:
#    -----BEGIN RSA PRIVATE KEY-----
# Then to convert from PKCS8 to RSA
openssl pkcs8 -inform PEM -nocrypt -in private_key_pk8.pem -out private_key_rsa.pem


```





# troubleshooting

```bash
# private key
# If you get an error such as this during DER -> PEM conversion ...
# 5496:error:0D0680A8:asn1 encoding routines:ASN1_CHECK_TLEN:wrong tag:.\crypto\asn1\tasn_dec.c:1294:
# 5496:error:0D06C03A:asn1 encoding routines:ASN1_D2I_EX_PRIMITIVE:nested asn1 error:.\crypto\asn1\tasn_dec.c:830:
# 5496:error:0D08303A:asn1 encoding routines:ASN1_TEMPLATE_NOEXP_D2I:nested asn1 error:.\crypto\asn1\tasn_dec.c:749:Field=n, Type=RSA
# 5496:error:0D09A00D:asn1 encoding routines:d2i_PrivateKey:ASN1 lib:.\crypto\asn1\d2i_pr.c:99:
# ... then you may have to convert the private key using one of the pkcs commands such as pkcs8. For example:
openssl pkcs8 -in private_key.der -nocrypt -inform D | openssl rsa -out private_key.pem -outform P
```

# certificate-signing request (csr)

```bash
# create CSR from a PEM-format private key
openssl req -new -key private_key.pem -out certificate_request.pem


# You will be prompted to interactively fill in these fields:
Country Name (2 letter code) []:
State or Province Name (full name) []:
Locality Name (eg, city) []:Amsterdam
Organization Name (eg, company) []:
Organizational Unit Name (eg, section) []:
Common Name (eg, fully qualified host name) []:
Email Address []:


# create PEM-format private key and CSR together
openssl req -newkey rsa:1024 -keyout private_key.pem -out certificate_request.pem


# create CSR from JKS Keystore private key
keytool -certreq -v -alias private_key_and_cert -file csr.pem -keypass some_key_password -storepass some_store_password -keystore keystore.jks

# view csr
openssl req -in certificate_request.pem -text -noout
```

# certificate

view certificate

```bash
# view certificate
openssl x509 -in certificate.pem -inform PEM -text -noout  # PEM-format cert
openssl x509 -in certificate.der -inform DER -text -noout  # DER-format cert

# if you get an error like the following:
#    unable to load certificate
#    10844:error:0906D06C:PEM routines:PEM_read_bio:no start line:pem_lib.c:647:Expecting: TRUSTED CERTIFICATE
# Then you might be attempting to view a CERTIFICATE REQUEST rather than a CERTFICIATE.  Try to view the file as a CSR to check.


# view certificate purpose
openssl x509 -in certificate.pem -purpose -noout

# This will output something like:
#    Certificate purposes:
#    SSL client : Yes
#    SSL client CA : Yes
#    SSL server : Yes
#    SSL server CA : Yes
#    Netscape SSL server : No
#    Netscape SSL server CA : Yes
#    S/MIME signing : Yes
#    S/MIME signing CA : Yes
#    S/MIME encryption : No
#    S/MIME encryption CA : Yes
#    CRL signing : Yes
#    CRL signing CA : Yes
#    Any Purpose : Yes
#    Any Purpose CA : Yes
#    OCSP helper : Yes
#    OCSP helper CA : Yes

# view raw dump of any PEM/DER-formatted file
openssl asn1parse -in priv9.pem -inform [PEM|DER]
```





create certificate

```bash
# create CA-signed certificate (PEM)
#   To create a certificate chain, a certificate should be signed by using 
#   the private key of a signing authority (eg. an intermediate CA). So you 
#   will first need the signing private key, and a CSR. Then, to use that CSR 
#   and private key to create and sign a certificate:
openssl x509 -req -days 360 -in certificate_request.pem -signkey private_key.pem -out certificate.pem

# create CA-signed cert using specific CA config
#   where:
#   -config
#   - see OpenSSL configuration section for details
openssl ca -config ./openssl_.cnf -in certificate_request.pem -keyfile private_key.pem -cert signing_cert.pem -out signed_cert.pem


# create intermediate-signed cert
# (TODO - clean up this next section as info is not complete)
#   where:
#   -CA: specifies the root CA's certificate
#   -CAkey: specifies the root CA's private key
#   -CAcreateserial: creates a serial number
#   -in: specifies the certificate request
#   -out specifies the output certificate
openssl x509 -req -days 360 -in certificate_request.pem -out certificate.pem -CA /ssl/ca/ca_cert.pem -CAkey /ssl/ca/ca_pk.pem -CAcreateserial

# create self-signed certificate (PEM)
#   where:
#   -in:      specifies the root CA's certificate requrest
#   -signkey: specifies the root CA's private key
#   -out:     specifies the filename where the root CA should be written
openssl x509 -req -days 360 -in certificate_request.pem -signkey private_key.pem -out certificate.pem

```



convert certificate format

```bash
# convert certificate format
openssl x509 -in input_cert.pem -inform PEM -out output_cert.der -outform DER  # PEM -> DER
openssl x509 -in input_cert.der -inform DER -out output_cert.pem -outform PEM  # DER -> PEM
```



# certificate authority

To configure OpenSSL as a CA, some settings in an openssl config file need to be set, and directories/files specified by that config file need to be created.

Get a local copy of the openssl config file:

```bash
cp /etc/pki/tls/openssl.cnf .
```

Modify:

    dir             = .                     # Where everything is kept

Create the subdirectories and files required by the config file:

```bash
mkdir certs
mkdir newcerts
mkdir crl
touch index.txt
echo "01" > serial
```

After doing thi (lost this part...)



# verify cert chain

verify certificate chain

```bash
# verify 2-level cert chain
#   where ca.pem is a PEM-encoded CA certificate, and cert.pem 
#   is a PEM-encoded certificate. This test will verify if cert.pem 
#   was signed by ca.pem.
openssl verify -verbose -CAfile ca.pem cert.pem

# verify n-level cert chain (unix)
openssl verify -verbose -CAfile <(cat Root.pem Intermediate2.pem Intermediate1.pem) test.onehub.akzonobel.com.pem

# verify n-level cert chain (windows)
#   1. Concatenate the root certificate and any intermediate certificates into a single, combined PEM-formatted file
#   2. Then verify the certificate against this combined ca file:
cat rootca.pem inter1.pem inter2.pem > combined_ca_file.pem
openssl verify -verbose -CAfile combined_ca_file.pem cert.pem

```



# verify cert and private key match

To test whether a certificate and a private key actually match, you can compare their "modulus". The modulus must be the same for a matching certificate and private key pair.

Get the modulus for the certificate:

```bash
openssl x509 -in certificate.pem -modulus -noout
```

This will output:

    Modulus=A5F547BE7C53BE4E3FA272757585672A0C0DA6CF6A90925DC9A9792FF660B509A26321CA64C8D12428127C93F26514E05F91F6A5CABCDA5AF0C49F5659CD
    220C5DC68D226FF5F5BBFD3C3C869E495B25A6A1E13BDFF24BDBC00641E52514F7F061D02BCB71A7A13936C5405C0D06D52D069A8225161F39C5DAF538271327B9B7

Get the modulus for the private key:

```bash
openssl rsa -in private_key.pem -modulus -noout
```

This will output something like:

    Modulus=A5F547BE7C53BE4E3FA272757585672A0C0DA6CF6A90925DC9A9792FF660B509A26321CA64C8D12428127C93F26514E05F91F6A5CABCDA5AF0C49F5659CD
    220C5DC68D226FF5F5BBFD3C3C869E495B25A6A1E13BDFF24BDBC00641E52514F7F061D02BCB71A7A13936C5405C0D06D52D069A8225161F39C5DAF538271327B9B7

If they match, then the private key matches the certificate.  If not, then they don't match and can not be used together. If you get an error such as ...

    5496:error:0D0680A8:asn1 encoding routines:ASN1_CHECK_TLEN:wrong tag:.\crypto\asn1\tasn_dec.c:1294:
    5496:error:0D06C03A:asn1 encoding routines:ASN1_D2I_EX_PRIMITIVE:nested asn1 error:.\crypto\asn1\tasn_dec.c:830:
    5496:error:0D08303A:asn1 encoding routines:ASN1_TEMPLATE_NOEXP_D2I:nested asn1 error:.\crypto\asn1\tasn_dec.c:749:Field=n, Type=RSA
    5496:error:0D09A00D:asn1 encoding routines:d2i_PrivateKey:ASN1 lib:.\crypto\asn1\d2i_pr.c:99:

... then you may have and private key in a different format, and may need to convert the private key using one of the pkcs commands such as pkcs8. For example:

```bash
openssl pkcs8 -in private_key.der -nocrypt -inform DER | openssl rsa -modulus -noout
```

    Modulus=A32A40135AD04E1659F5E3E88A262207DD5A18637EBC28B1D129D154FBF0A942E06652C6CD6929D8DCC1108EE874EC6999A8767E39B0796E
    08F7BA3CE7BF7CC05B0E530D830F781D279AD691DF70A043C3E1B4FC060C97431D0C899EAB369DAF2FB2F47923B076F9592CD74FF6D7E879BB1912CC
    8E9987BC3E8EE8A8C7121685197C543CE6E0DD96CA471A4E25FDE8C21FD57674D2CF0C8825869F26BD3CF25B8A36CE1D11B9123D9DBF5925138A130D
    C13ED87B6DF01AF8ABFCF9E5E31967C9

# keystore and truststore

create keystore

```bash
# create PEM keystore
#
#   A PEM format keystore is simply the concatenation of a 
#   PEM-format private key and a PEM-format certificate. So to 
#   create one, you could simply do the following:
cat private_key.pem certificate.pem > keystore.pem

# create JKS truststore
keytool -import -trustcacerts -alias some_alias -keystore truststore.jks -file ca.pem


# create private key and JKS truststore
# The following will generate a private key, and place it inside of a JKS keystore.  
# This is useful because there is no other easy way to get a private key into a JKS keystore.
keytool -genkey -alias private_key_and_cert -keyalg RSA -keysize 1024 -dname "CN=some_cn,OU=some_ou,O=some_o" -keypass some_key_password -keystore keystore.jks -storepass some_store_password
#
# NOTE! The -alias you specify here will be the same alias used when adding 
# the corresponding certificate after it is signed.  So, consider this fact when 
# naming it. You may want to name it something like private_key_and_cert, rather 
# than just private_key.
#
# if you get the following error:
# keytool error: java.io.IOException: Incorrect AVA format
# It is because your -dname parameter is not formatted correctly.  Ensure it follows the format: CN=some_cn,OU=some_ou,O=some_o

```



add to keystore

```bash
# add root or immediate cert to JKS keystore
#
#   NOTE:  Please note the use of the parameters:
#   -trustcacerts
#   -noprompt
keytool -import -v -keystore keystore.jks -storepass manage -alias cert_alias -file cert.pem -trustcacerts -noprompt 


# add a (non-root, non-intermediate) cert to a JKS keystore
# 
#   NOTE!
#   - You should always add the root certificate, and any intermediate 
#     certificates to the keystore before doing this operation!  This is 
#     important for the keystore to "chain" the certificates together correctly.
#   - The –trustcacerts and –noprompt parameters are NOT used in this case
#   - The alias name used must match the name used when generating the private key
keytool -import -v -keystore keystore.jks -storepass manage -alias cert_alias -file cert.pem -keypass manage 
#
# If you get the following error:
#
#   keytool error: java.security.cert.CertificateException: DerInputStream.getLength(): lengthTag=127, too big.
#
# Then it is probably because there are extra lines on the end of the PEM format 
# certificate file. Remove any extra lines from the file and try again.


# add private key to a JKS keystore
#
#   keytool does not allow this.  Its easiest to just create the keystore using 
#   keytool when you generate the private key.  This will generate the private key 
#   and place it into the keystore.
#
#   There is a workaround listed here, but this involves a custom java class that they wrote:
#   http://www.agentbob.info/agentbob/79-AB.html


# add a PEM-format certificate and private key to a PKCS12 keystore
#   To convert a PEM-format certificate and private key into a PKCS#12 file:
#   You will be prompted with the following:
#      Enter Export Password:
#      Verifying - Enter Export Password:
openssl pkcs12 -export -in servercert.pem -inkey serverpk.pem -CAfile rootca.pem -name "server" -out server.p12

```



view keystore

```bash
# View contents of a JKS keystore
keytool -list -v -keystore keystore.jks

## View contents of a PKCS12 keystore (keytool)
keytool -list -keystore keystore.p12 -storetype pkcs12

# View contents of a PKCS12 keystore (openssl)
# NOTE: will show certificates only
openssl pkcs12 -in keystore.p12 -nokeys

# without requiring password: 
# TODO: Keystores can be viewed without the password, just not modified.  
# Need more info on this.
```



convert keystore

```bash
# convert PEM Keystore to a PKCS12 Keystore
openssl pkcs12 -export -in keystore.pem -out keystore.p12

# convert a PKCS12 keystore to a JKS keystore
# This conversion can be done using the org.mortbay.jetty.security.PKCS12Import class from a jetty installation:
java -classpath org.mortbay.jetty.jar org.mortbay.util.PKCS12Import keystore.p12 keystore.jks
# Notes:
# - The class org.mortbay.util.PKCS12Import is located in a jetty jar org.mortbay.jetty.jar
# - This jar is located in a MWS installation: <MWS Install Dir>/MWS/lib/ext/org.mortbay.jetty.jar


# Convert a JKS file to PKCS12 format using keytool(Java 1.6.x and above):
keytool -importkeystore -srckeystore KEYSTORE.jks -destkeystore KEYSTORE.p12 -srcstoretype JKS -deststoretype PKCS12 -srcstorepass mysecret -deststorepass mysecret -srcalias myalias -destalias myalias -srckeypass mykeypass -destkeypass mykeypass -noprompt

```



export from keystore

```bash
# export certs and keys from a PKCS12 keystore
#
#   Integration Server can not import PKCS#12 directly. The following 
#   steps can be used to export the certificates and keys in a format 
#   Integration Server can use. Note that this procedure only covers 
#   PKCS#12 files with a single keypair. PKCS#12 files can contain multiple 
#   keypairs.  More complex PKCS#12 files require additional intermediate steps.


# export client certs from PKCS12 keystore
openssl pkcs12 -in keystore.p12 -clcerts -nokeys > cert.pem

# export CA certs from PKCS12 keystore
openssl pkcs12 -in keystore.p12 -cacerts -nokeys > rootca.pem

# export private key from PKCS12 keystore
openssl pkcs12 -in keystore.p12 -nocerts -nodes > private_key.pem

# export private key from JKS keystore
#   Use ExportPrivateKey.jar utility (http://www.anandsekar.com/2006/01/19/exporting-the-private-key-from-a-jks-keystore/)
#   This will export key as a PKCS8 private key.
java -jar ExportPrivateKey.zip keystore.jks JKS some_keystore_password private_key_alias private_key_pk8.pem

```




# External Links 

- http://sial.org/howto/openssl/ (Some nice OpenSSL documentation)
- https://www.digicert.com/kb/ssl-support/openssl-quick-reference-guide.htm
- 







