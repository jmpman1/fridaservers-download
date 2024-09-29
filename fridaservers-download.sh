#!/bin/bash
#
# Frida Servers Download v1.0
#
# Author: jmpman
# Date: 09/28/24

URLS=$(curl -s https://api.github.com/repos/frida/frida/releases/latest | gojq '.assets[] | select(.name | contains ("server")) | .browser_download_url')
VERSION=$(curl -s https://api.github.com/repos/frida/frida/releases/latest | gojq '.tag_name' | tr -d '"')

banner() {
	echo "     ____
    / _  |   
   | (_| |
    > _  |   Frida Servers Download v1.0
   /_/ |_|   by jmpman
   . . . .     
   . . . .
   . . . .
   . . . ."
}

banner

echo "Downloading Frida Servers from latest version..."

if [ -z "$URLS"  ]; then
	echo "ERROR: No Frida Servers were found to be downloaded. Aborting installation."
	exit 1
fi

mkdir -p $VERSION
cd $VERSION || exit

echo "$URLS" | while read -r url; do
	FILTERED_URL=$(echo "$url" | tr -d '"')
	FILE_NAME=$(basename "$FILTERED_URL")
	wget -q "$FILTERED_URL"

	if [[ "$FILE_NAME" == *.xz ]]; then
	    xz --decompress -q "$FILE_NAME"
	    
	    if [ $? -eq 0 ]; then
	      rm -f "$FILE_NAME"
	    else
	      echo "Extraction failed for $FILE_NAME. Keeping the archive."
	  fi
	fi
done

echo "Download Completed"