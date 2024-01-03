# upload.sh
### a silly shell script I wrote that allows you to search your filesystem with fzf and upload a file using curl, for example to 0x0.st or temp.sh
```
Usage: upload [OPTIONS]
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
      find, fzf, tar, curl, xclip or wl-clipboard
```

## Installing:
### Install per user:
    $ curl -o ~/.local/bin/upload https://raw.githubusercontent.com/SlashAcorn/upload.sh/main/upload.sh
Note that `~/.local/bin/` needs to be in your `$PATH`
### Install system-wide:
    # curl -o /usr/bin/upload https://raw.githubusercontent.com/SlashAcorn/upload.sh/main/upload.sh
