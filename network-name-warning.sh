#!/usr/bin/env bash

# for safety: https://sipb.mit.edu/doc/safe-shell/
set -uf -o pipefail

DESIRED_NAME=$1
MISMATCH_ADVICE=${2:-}

COMPUTER_NAME=`scutil --get ComputerName`
LOCAL_HOST_NAME=`scutil --get LocalHostName`
HOST_NAME=`scutil --get HostName`

echo "Desired name: \"${DESIRED_NAME}\""
echo "Computer name: \"${COMPUTER_NAME}\""
echo "Local host name: \"${LOCAL_HOST_NAME}\""
echo "Host name: \"${HOST_NAME}\""

function warn {
  MSG="$1 ($2) does not match desired name ($DESIRED_NAME)"
  open -b com.apple.systempreferences /System/Library/PreferencePanes/SharingPref.prefPane/
  osascript -e "
    set theAlertText to \"${MSG}\"
    set theAlertMessage to \"${MISMATCH_ADVICE}\"
    display alert theAlertText message theAlertMessage as critical
  "
  echo "WARNING: ${MSG}"
  exit 1
}

if [ $DESIRED_NAME != $COMPUTER_NAME ]; then
  warn "Computer name" $COMPUTER_NAME
fi

if [ $DESIRED_NAME != $LOCAL_HOST_NAME ]; then
  warn "Local host name" $LOCAL_HOST_NAME
fi

if [ $DESIRED_NAME != $HOST_NAME ]; then
  warn "Host name" $HOST_NAME
fi
