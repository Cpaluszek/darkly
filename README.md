# darkly
Introductory project to computer security in the specific field of the web.

**CTF**
**Pentest**

## Tools
- [Get Kali | Kali Linux](https://www.kali.org/get-kali/#kali-installer-images)
- [ZAP](https://www.zaproxy.org/)
- [Debian Security Tools Packaging Team / wapiti · GitLab](https://salsa.debian.org/pkg-security-team/wapiti)

## How to run the audit
- clone the repo
- `python3 -m http-server` to see the ZAP report on `localhost:8000`
- `docker build -t kali .`
- `docker run -it kali`
- we are within the container and can execute the scripts copied into `root/scripts`

## Found vulnerabilities
- SQL injection
    - [SQL injection member page](./vulnerabilities/sql_injection_member/Resources/sql_injection_member.md)
    - [SQL injection image page](./vulnerabilities/sql_injection_image/Resources/sql_injection_image.md)
- [Password brute force attack](./vulnerabilities/weak_password/Ressources/weak_password.md)
- [Directory browsing](./vulnerabilities/directory_browsing_whatever/Resources/directory_browsing_whatever.md)
- [Password recover without form validation](./vulnerabilities/password_recover/Resources/password_recover.md)
- [Cookie week encryption](./vulnerabilities/cookie/Resource/cookie.md)
