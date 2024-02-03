- Open Postman and create a new request.
- Set the HTTP method to POST and enter the URL `http://x.x.x.x/index.php?page=upload` => the same we land to if clicking on ADD IMAGE at the bottom of the homepage
- In the Headers section, add a new header with the key `Content-Type` and the value `multipart/form-data` 
- In the Body tab and select `form-data`.
- Enter "Upload" in the `Key` field and "Upload" in the `Value` field.
- Add another key-value pair. For the `key`, enter "uploaded". For the `value`, click on the dropdown menu on the right and select `File`.
  Then click on the Select Files button that appears and choose the attack.php in `vulnerabilities/upload_file/fake_php`. Click on the 3 dots and add `Content-type` field to Body and set type of file to `image/jpeg` => to bypass security measures that may be in place on the server. Many servers are configured to reject certain types of files that are commonly associated with attacks, such as PHP files.
- Click on the Send button to send the request.
- After receiving the response, click on the search lens and type 'The flag is' => the response contains the flag. 
