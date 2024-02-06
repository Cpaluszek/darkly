[README.md](../../../README.md)
# Password recover
## Reconnaissance
- If we inspect the footer of the homepage, we discover that the copyright BorntoSec unordered list tag contains a link to a page:
```
<ul class="copyright">
	<a href="?page=b7e44c7a40c5f80139f0a50f3650fb2bd8d00b0d24667c4c2ca32c88e13b758f"><li>&copy; BornToSec</li></a>
</ul>

```
- we follow the link and land on a page that teach us what "Les Diomédéidés (Diomedeidae)" a sea birds family. 
- we go further and inspect the page. If we select the image, we can find some detail in the `Elements` folder of the inspector. A digression on "Lorem Ipsum" history and some misterious clue:

```
<!--
You must come from : "https://www.nsa.gov/".
-->
```
ans
```
let's use this browser : "ft_bornToSec". It will help you a lot.
```
So, what is this all about?

Not easy to answer without knowing what spoofing is, why hackers do that, what headers are, and in particular what referer and user-agent headers are exactly.

### Spoofing
The act of falsifying or impersonating something to deceive or manipulate a system.

### Referer
A Referer (originally a misspelling of "referrer") is an HTTP header field that identifies the address of the webpage that linked to the resource being requested. In simpler terms, it tells the web server where the user came from before accessing the current page. 
It contains the URL of the web page that referred the user agent to the current page or resource being requested.
The Referer header is typically used for analytics, tracking user navigation paths, implementing access controls

### User-Agent
The User-Agent header contains information about the user agent (such as a web browser, web crawler, or other client software) making the HTTP request.
It identifies the type and version of the client software, as well as information about the operating system and device characteristics.
The User-Agent header helps web servers tailor responses to the capabilities and preferences of the client software, such as serving different content or stylesheets based on the browser type.
Example: User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36

### Why spoofing user-agent and referer headers could be a vulnerability?
- Access Control Bypass: Some websites might implement access controls or restrictions based on the User-Agent or Referer headers. By spoofing or modifying these headers, an attacker could potentially bypass such controls and gain unauthorized access to restricted resources or functionality on the website.

- User Tracking Evasion: Websites often track user behavior and activities based on the User-Agent and Referer headers. If an attacker modifies or omits these headers, they may evade detection and tracking mechanisms, making it harder for website administrators to monitor their activities and detect malicious behavior.

- Content Protection Circumvention: Websites may use Referer headers to restrict access to certain content based on the source of the request. By spoofing the Referer header, an attacker could attempt to access protected content without proper 

## Exploit
In Postman we made a GET request to the page linked in the footer of our website, adding 2 headers:
referer = `https://www.nsa.gov/`
user-agent = `ft_bornToSec`

That's all.

## Prevention
- Input Validation and Sanitization:
Validate and sanitize all input received from HTTP headers, including Referer and User-Agent.
- Strict Referer Policy:
Implement a strict Referer policy that only accepts requests from known and trusted sources.
- User-Agent Whitelisting:
Maintain a whitelist of known and trusted User-Agent strings used by legitimate clients.