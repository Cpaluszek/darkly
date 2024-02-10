#!/bin/bash

# Check if IP_ADDRESS environment variable is set
if [ -z "$IP_ADDRESS" ]; then
  echo "Error: IP_ADDRESS environment variable is not set."
  echo "Please set the IP_ADDRESS environment variable with the target IP address."
  exit 1
fi

DOWNLOAD_DIR="./download_hidden"
mkdir -p "$DOWNLOAD_DIR"
cd "$DOWNLOAD_DIR"

echo "Downloading files from http://$IP_ADDRESS/.hidden/ ..."

if wget -np -r -e robots=off "http://$IP_ADDRESS/.hidden/" > download.log 2>/dev/null; then
  echo -e "\n\nDownload complete.\n"
  echo "Searching for files named README that contain digits ..."
  echo -e "\n\n"
  find . -name "README" -type f -print0 | xargs -0 grep -Hn '[0-9]'
else
  echo "Error: Failed to download files from http://$IP_ADDRESS/.hidden/"
  /bin/rm -rf "$DOWNLOAD_DIR"
  exit 1
fi

/bin/rm -rf ../download_hidden ../download.log