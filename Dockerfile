FROM kalilinux/kali-rolling

# TODO: set the correct IP address
ENV IP_ADDRESS=192.168.76.129

RUN apt-get update \
    && apt-get install -y vim curl hydra sqlmap figlet wget

RUN mkdir -p /root/password_list \
  && curl -k https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-500.txt -o /root/password_list/10-million-password-list-top-500.txt

RUN mkdir -p /root/vulnerabilities
COPY ./vulnerabilities /root/vulnerabilities
RUN chmod -R +x /root/vulnerabilities/*

CMD ["bash"]