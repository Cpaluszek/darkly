[README.md](../../../README.md)
# Robots

## Reconnaissance
### ZAP
Zap indicates: GET http://10.13.200.51/robots.txt`
Alert tags	
OWASP_2021_A05
OWASP_2017_A06
WSTG-v42-INFO-02
Alert description	
The web/application server is leaking version information via the "Server" HTTP response header. Access to such information may facilitate attackers identifying other vulnerabilities your web/application server is subject to.

Going deeper:
- what is robots.txt ? 
By using the robots.txt file, website owners can control how search engines and other web crawlers interact with their site, ensuring that sensitive or irrelevant content is not indexed and displayed in search engine results pages.
The problem is that "disallowing" crawlers from scrapping and indexing some directory, robots.txt is also giving hackers valid informations on where to look at to discover sensitive information.
In our case we find that the following are disollowed:
```
User-agent: *
Disallow: /whatever
Disallow: /.hidden
```
That's why, first thing first, we go look into them.

But befor going further, what is a crawler?
- A crawler, also known as a web crawler, web spider, or web robot, is an automated program or script that systematically browses the World Wide Web, typically for the purpose of indexing web content. Crawlers play a crucial role in the operation of search engines and other web services that rely on indexing and organizing web content.

## Exploit
- Accessing "/.hidden" reveals a directory structure with multiple README files.
- Manually inspecting README files shows repetitive content across many files.
- if `curl http://192.168.76.129/.hidden/whtccjokayshttvxycsvykxcfm/igeemtxnvexvxezqwntmzjltkt/lmpanswobhwcozdqixbowvbrhw/README`
we have the flag:
`Hey, here is your flag : d5eec3ec36cf80dce44a896f961c1831a05526ec215693c8f2c39543497d4466`

## Prevention
- Removing Unnecessary or Sensitive Files
- Protecting Files from Public Access:
    - place these files outside of the web server's document root directory. This prevents direct access via HTTP requests.
   - Using the .htaccess File 
    - The .htaccess file is a configuration file used by the Apache web server to control various aspects of website behavior, including access control.