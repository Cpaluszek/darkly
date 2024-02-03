# darkly

## References
- [Get Kali | Kali Linux](https://www.kali.org/get-kali/#kali-installer-images)
- [ZAP](https://www.zaproxy.org/)


## How to run the audit
- clone the repo
- `python3 -m http-server` to see the ZAP report on `localhost:8000`
- `docker build -t kali .`
- `docker run -it kali`
- we are within the container and can execute the scripts copied into `root/scripts`

## Vulnerabilities

### Brute force attack
**ZAP report:**
> 8. Risk=Informational, Confidence=High (1) > Authentication Request Identified (1)
> - GET http://10.13.200.51/?Login=Login&page=signin&password=ZAP&username=ZAP
> - alert description: The given request has been identified as an authentication request. The 'Other Info' field contains a set of key=value lines which identify any relevant fields. If the request is in a context which has an Authentication Method set to "Auto-Detect" then this rule will change the authentication to match the request identified.

**Attack method:** using hydra to perform a brute-force attack by sending multiple HTTP GET requests to the login form, trying different passwords from the specified password list file

hydra command in the script `attack_password.sh` breakdown:
- `-l` admin: Specifies the username to be tested, in this case, "admin".
- `-P` /root/password_list/10-million-password-list-top-500.txt: Specifies the path to the password list file containing the passwords to be tested.
- `-F` Terminates the session if a positive result (successful login) is found.
- `-o` hydra.log: Specifies the output file where the results of the brute-force attack will be logged.
    "$IP_ADDRESS": Uses the value of the IP_ADDRESS environment variable as the target IP address for the attack.
    http-get-form '/index.php:page=signin&username=^USER^&password=^PASS^&Login=Login:F=images/WrongAnswer.gif': Specifies the form parameters to be used in the attack. In this case, it's sending a GET request to the login form with the provided parameters (username and password). The placeholders ^USER^ and ^PASS^ will be replaced by the usernames and passwords from the password list file. If the login fails, it expects the response to contain the string "images/WrongAnswer.gif".

**How to address security concerns for btutal force attacks:**
- Strong Password Policy: Enforce a strong password policy that requires users to create complex passwords. This policy could include requirements such as minimum length, the use of uppercase and lowercase letters, numbers, and special characters.
- CAPTCHA or Rate Limiting: Implement CAPTCHA challenges or rate-limiting mechanisms to prevent automated tools like Hydra from making multiple login attempts within a short period. 
- Two-Factor Authentication (2FA)


- 2.Missing Anti-clickjacking Header (1)
    - Attacker Creates a Manipulated URL: The attacker crafts a URL with a manipulated "site" parameter that points to a malicious website, like :
    `index.php?page=redirect&site=malicioussite class="icon fa-facebook"`
`
    - Attacker Distributes the URL: The attacker might send this URL to potential victims through phishing emails, social media messages, or by placing it on compromised websites.
