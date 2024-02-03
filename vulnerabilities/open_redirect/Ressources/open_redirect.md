# Open redirect

**ZAP report:**
Risk=Low, Confidence=Medium (5)

http://10.13.200.51 (5)
Big Redirect Detected (Potential Sensitive Information Leak) (1)
GET http://10.13.200.51/index.php?page=redirect&site=instagram

=> Zap identifies a possible vulnerability in the redirect link in the footer

**Attack method:**
- Attacker Creates a Manipulated URL: The attacker crafts a URL with a manipulated "site" parameter that points to a malicious website, like :
`IP_ADDRESS/index.php?page=redirect&site=whatever`

- Attacker Distributes the URL: The attacker might send this URL to potential victims through phishing emails, social media messages, or by placing it on compromised websites.

**How to address security concerns for btutal force attacks:**
- Validate and Sanitize Input: Always validate and sanitize user inputs that control the redirection target. You can use allowlists of safe URLs or use libraries designed to parse and cleanse URLs