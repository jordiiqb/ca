# Pràctica CERTIFICATS DIGITALS

En aquesta pràctica es crea un servidor ldap amb la configuració de edt.org però utilitzant la configuració de certificats per a crear una connexió segura.

Per la creació dels certificats he utilitzat les següents ordres:

```bash
[isx48172244@localhost ca]$  openssl genrsa -out ca-key.pem 1024
Generating RSA private key, 1024 bit long modulus
..........................................+++++
.......................+++++
e is 65537 (0x010001)

```

```bash
[isx48172244@localhost ca]$  openssl req -new -x509 -nodes -sha1 -days 365 -key ca-key.pem -out ca-crt.pem
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [XX]:CA
State or Province Name (full name) []:Barcelona
Locality Name (eg, city) [Default City]:Barcelona
Organization Name (eg, company) [Default Company Ltd]:Veritat Absoluta
Organizational Unit Name (eg, section) []:Certification Department
Common Name (eg, your name or your server's hostname) []:Veritat Absoluta
Email Address []:admin@edt.org

```
    
```bash
[isx48172244@localhost ca]$ openssl genrsa -out server-key.pem 1024
Generating RSA private key, 1024 bit long modulus
.......................+++++
......................+++++
e is 65537 (0x010001)

```
    
```bash
[isx48172244@localhost ca]$ openssl req -new -key server-key.pem -out server-csr.pem
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [XX]:CA
State or Province Name (full name) []:Barcelona
Locality Name (eg, city) [Default City]:Barcelona
Organization Name (eg, company) [Default Company Ltd]:Escola del Treball
Organizational Unit Name (eg, section) []:Departament d'Informàtica
Common Name (eg, your name or your server's hostname) []:ldap.edt.org
Email Address []:admin@edt.org

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:recuperacio
An optional company name []:edt
```

```bash
[isx48172244@localhost ca]$ openssl x509 -CA ca-crt.pem -CAkey ca-key.pem -req -in server-csr.pem -days 365 -sha1 -extfile ca.conf -CAcreateserial -out server-crt.pem
Signature ok
subject=C = CA, ST = Barcelona, L = Barcelona, O = Escola del Treball, OU = Departament d'Inform\C3\83\C2\A0tica, CN = ldap.edt.org, emailAddress = admin@edt.org
Getting CA Private Key

```

Els canvis fets als fitxers de configuració de ldap per permetre les connexiosn segures les he agafades dels apunts del professor. Per veure els canvis, has de comparar els fitxers amb altres versions del servidor ldap.

