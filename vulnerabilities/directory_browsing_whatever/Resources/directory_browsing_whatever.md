[README.md](../../../README.md)
# Directory browsing

## Reconnaissance
### ZAP
```
GET http://10.13.200.51/whatever/
Alert tags	
OWASP_2021_A05
OWASP_2017_A06
Alert description	
It is possible to view a listing of the directory contents. Directory listings may reveal hidden scripts, include files, backup source files, etc., which can be accessed to reveal sensitive information.
```
[A05 Security Misconfiguration - OWASP Top 10:2021](https://owasp.org/Top10/A05_2021-Security_Misconfiguration/)
[OWASP Top Ten 2017 | A6:2017-Security Misconfiguration | OWASP Foundation](https://owasp.org/www-project-top-ten/2017/A6_2017-Security_Misconfiguration.html)

## Exploit
If we access: `http://x.x.x.x/whatever/`

We can see a file named `htpasswd` which can be downloaded.

**File content:**
`root:437394baff5aa33daa618be47b75cb49`

We decoded the password value using MD5 encryption via the following website:
- [MD5 Online | Free MD5 Decryption, MD5 Hash Decoder](https://www.md5online.org/md5-decrypt.html)

**Result:** `qwerty123@`

If we try to input the decrypted password and user on the page: `http://x.x.x.x/admin`

We get this result:
![Result](./admin.png)

`The flag is : d19b4823e0d5600ceed56d5e896ef328d7a2b9e7ac7e80f4fcdb9b10bcb3e7ff`

## Prevention
	
Configure the web server to disable directory browsing.
- Deploy a minimal platform wihout unnecessary files.
- A segmented application architecture that proviedes secure separation between components. Ex: *Containerization*.

[A05 Security Misconfiguration - OWASP Top 10:2021](https://owasp.org/Top10/A05_2021-Security_Misconfiguration/)
[OWASP Top Ten 2017 | A6:2017-Security Misconfiguration | OWASP Foundation](https://owasp.org/www-project-top-ten/2017/A6_2017-Security_Misconfiguration.html)