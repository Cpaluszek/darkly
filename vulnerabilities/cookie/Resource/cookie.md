[README.md](../../../README.md)
# Cookie

When inspecting the website, we can see a cookie:
`I_am_admin=68934a3e9455fa72420237eb05902327`

We decoded the cookie using MD5 encryption via the following website:
- [MD5 Decrypter - Password Hash Cipher (+Salt) - Online Decoder](https://www.dcode.fr/md5-hash)

**Decrypted value:**
`false`

By altering the cookie with MD5 encryption, we can set it to true:
`true` -> `b326b5062b2f0e69046810717534cb09`

When we modified the cookie value and refreshed the page, an alert appeared:

```
Good job! Flag : df2eb4ba34ed059a1e3e89ff4dfc13445f104a1a52295214def1c4fb1693a5c3
```

## Prevention
Do not use cookie for admin access!

Cookie is not recommended for sensitive content.
- Stored on the client side, which makes them susceptible to being intercepted.
MD5 algorithm is a weak encryption method. SHA would be a better pick.


### Managing admin access properly:
- **Role-based access control (RBAC)** to control access to administrative features.
    - [Role-based access control - Wikipedia](https://en.wikipedia.org/wiki/Role-based_access_control)
- Require admins to authenticate using multiple factors such as passwords, SMS codes, or biometrics.

### Why MD5 is bad
- MD5 hashes can be easily cracked using precomputed rainbow tables, making it insecure for password storage or any security-sensitive data.
- More secure hashing algorithms such as SHA-256 and SHA-3 are available, which offer better resistance to attacks and are recommended for cryptographic purposes.
