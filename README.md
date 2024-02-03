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
