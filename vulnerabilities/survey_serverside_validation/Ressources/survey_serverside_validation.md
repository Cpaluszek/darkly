[README.md](../../../README.md)
# Password recover
## Reconnaissance
- If we click on the survey option in the tolbar we land to a page where we can select a value from 1 to 10 as grade for a certain subject.
- we are hackers, professional hackers, and know that most of them, unconscious coders, love to validate input on client side
- and this is bed !
- why ?
- we'll tell you later
- to test that we curl the page to check which value the input of survey was related to 
- this is what we found:
```
<form action="#" method="post">
					<input type="hidden" name="sujet" value="2">
					<SELECT name="valeur" onChange='javascript:this.form.submit();'>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</SELECT>
				</form>
```
- what's that? just a form among the multiple that we have in this page. and what this form has in particular? A "sujet" with a value, and a "valeur" with its value
- if the values are not checked on server side we can easily modify them without the program to notice that.
- ready ?


## Exploit
- in postman we make a POST request to http://x.x.x.x/index.php?page=survey
- in the body ze select the form-data option.
- we add the key-value pairs for the inputs:
    - Key: sujet
    - Value: a value from 2 to 6 (corresponding to each survey in the form)
    - Key: valeur
    - Value: A value greater then 10 => that should not be accepted
- and what we discover ? the flag ! why? because there's no validation on server side



## Prevention
But waut. Why is it so important the server side validation?
Easy. 2 reasons.
1. you don't want to rely only on javascript validation. It's good to give good user a fast return of experience in the case of error. But it's bad for the malicious user able to desactivate it and bybass it.
2. you don't want to rely on html 5 type validation. A simple curl in CLI can bypass it.
You definetely want to rely on the only protector of your DB, the backend, the server, the way you want to name it. 

So how to prevent this vulnerability?

Just validate input on server side. Easy. Enough.