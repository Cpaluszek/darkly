FROM kalilinux/kali-rolling

ENV IP_ADDRESS=192.168.1.32

RUN apt-get update \
    && apt-get install -y vim curl hydra

RUN mkdir -p /root/password_list \
  && curl -k https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-500.txt -o /root/password_list/10-million-password-list-top-500.txt

RUN mkdir -p /root/scripts
COPY ./password /root/scripts/password
RUN chmod +x /root/scripts/password/attack_password.sh

CMD ["bash"]