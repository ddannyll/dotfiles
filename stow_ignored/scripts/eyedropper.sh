#/bin/bash
grim -g "$(slurp -p)" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | awk -F ' ' 'NR==2 {print $3}' | tee >(wl-copy) | sed -E 's/^(.*)$/"Copied \1 to clipboard"/' | xargs notify-send
