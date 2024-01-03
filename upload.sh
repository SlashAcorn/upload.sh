#! /bin/sh

#!/bin/bash

show_help() {
    echo "Usage: upload [OPTIONS]
Options:
-h, --help     Show this help message

-c  --compress Compress file and upload it, allows for directories
               to be uploaded

-t  --temp     Uses https://temp.sh instead of https://0x0.st,
               allows for larger files but only lasts 3 days

-u  --url      Uses specified url to upload files to if you want to
               use anything other than 0x0.st and temp.sh
-w  --wayland  Uses wl-copy instead of xclip, note that xclip works
               on Wayland too

Note: This script requires the following programs:
      find, fzf, tar, curl, xclip or wl-clipboard"
}

compress=false
url="0x0.st"
copy="xclip -selection c"

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -c|--compress)
        	compress=true
            ;;
        -t|--temp)
        	url="temp.sh/upload"
            ;;
        -u|--url)
            url="$OPTARG"
        	;;
        -w|--wayland)
            copy="wl-copy"
	        ;;
        *)
            # Check if the argument is an option (starts with '-')
            if [[ "$1" == -* ]]; then
                echo "Error: Unknown option '$1'"
                show_help
                exit 1
            fi
            # Add your script logic for non-option arguments here if needed
            ;;
    esac
    shift
done

# Add your script logic below this line
# ...

if $compress; then
    file=$(find $HOME -type f,d | fzf +i -e)
    tar -cJf "/tmp/archive.tar.xz" -C "$(dirname "$file")" "$(basename "$file")"
    uploadfile="/tmp/archive.tar.xz"
else
    uploadfile=$(find $HOME -type f | fzf +i -e)
fi

curl -F "file=@$uploadfile" $url | $copy
notify-send "The link to your file has been copied to the clipboard."
