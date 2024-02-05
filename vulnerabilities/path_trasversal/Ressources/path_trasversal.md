
[README.md](../../../README.md)
# Path trasversal

## Reconnaissance
### ZAP
Zap indicates with `Directory Browsing (Medium) 18280 (79,478.3%)`
that directory browsing is enabled, and it's considered a medium-risk vulnerability. Directory browsing can potentially allow an attacker to traverse directories and access sensitive files, such as /etc/passwd, by crafting specific URL paths with ../ sequences.


## Exploit
- We first manually manipulated the page parameter by adding ../ to see if we could traverse directories.
- After appending ../ and reloading the page, the content of the alerts changed, from "wtf" to "almost" to "you can do it"
- We attempted to access common sensitive files like /etc/passwd, /etc/hosts, and /root by appending their paths to the URL.
- After trying with  /etc/passwd we got the flag
- To streamline the exploitation process, we created a Bash script to automate the traversal attempts.
- The script iteratively added ../ to the page parameter and monitored the responses for the flag pattern "The flag is."

## Prevention
- Input Validation and Sanitization
    - Use whitelists to allow only specific characters or patterns in input.
    - Reject any input that contains sequences like ../ or starts with /.

- File Access Control
    - Implement proper file access controls to restrict access to sensitive files and directories.
    - Set appropriate file permissions to prevent unauthorized access.