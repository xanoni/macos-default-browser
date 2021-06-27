#! /usr/bin/env -S bash -e

PS3="Select new default browser: "
# Remove browsers from below line to exclude them from the menu
options=("brave" "chrome" "chrome-canary" "firefox" "firefox-dev" "safari" "edge" "edge-canary" "onion")
params="--make-default-browser"  # works for most browsers (not Firefox)

select opt in "${options[@]}"; do
  case "$opt,$REPLY" in
    brave,*|*,brave)
        browser="Brave Browser"; break ;;
    chrome,*|*,chrome)
        browser="Google Chrome"; break ;;
    chrome-canary,*|*,chrome-canary)
        browser="Google Chrome Canary"; break ;;
    firefox,*|*,firefox)
        browser="ffox"; params="-silent -nosplash -setDefaultBrowser"; break ;;
    firefox-dev,*|*,firefox-dev)
        browser="Firefox Developer Edition"; params="-silent -nosplash -setDefaultBrowser"; break ;;
    safari,*|*,safari)
        browser="Safari"; break ;;
    edge,*|*,edge)
        browser="Microsoft Edge"; break ;;
    edge-canary,*|*,edge-canary)
        browser="Microsoft Edge Canary"; break ;;
    onion,*|*,onion)
        browser="Tor Browser"; params="-silent -nosplash -setDefaultBrowser"; break ;;
  esac
done

open -a "${browser}" --new --args ${params}
echo -en "\nDefault browser set to: ${browser}.\n"

