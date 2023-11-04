#! /usr/bin/env -S bash -e

# Remove browsers from below line to exclude them from the menu
options=("brave" "chrome" "chrome-canary" "firefox" "firefox-dev" "safari" "edge" "edge-canary" "onion")
params="--make-default-browser"  # works for most browsers (not Firefox)

if [ $# -eq 0 ]; then
    select opt in "${options[@]}"; do
        choice=$opt
        break # Make sure to break out of the select loop once a choice is made
    done
else
    # Check if the provided argument is a valid option
    if [[ " ${options[*]} " =~ " $1 " ]]; then
        choice=$1
    else
        echo "Unsupported browser. Exiting..."
        exit 1
    fi
fi

case "$choice" in
    brave)
        browser="Brave Browser"; params="--make-default-browser"; ;;
    chrome)
        browser="Google Chrome"; params="--make-default-browser"; ;;
    chrome-canary)
        browser="Google Chrome Canary"; params="--make-default-browser"; ;;
    firefox)
        browser="Firefox"; params="-silent -nosplash -setDefaultBrowser"; ;;
    firefox-dev)
        browser="Firefox Developer Edition"; params="-silent -nosplash -setDefaultBrowser"; ;;
    safari)
        browser="Safari"; params="--make-default-browser"; ;;
    edge)
        browser="Microsoft Edge"; params="--make-default-browser"; ;;
    edge-canary)
        browser="Microsoft Edge Canary"; params="--make-default-browser"; ;;
    onion)
        browser="Tor Browser"; params="-silent -nosplash -setDefaultBrowser"; ;;
    *)
        echo "Unsupported browser. Exiting..."
        exit 1
  esac

open -a "${browser}" --new --args ${params}
echo -en "\nDefault browser set to: ${browser}.\n"
