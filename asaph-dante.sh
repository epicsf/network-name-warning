#!/usr/bin/env bash

# for safety: https://sipb.mit.edu/doc/safe-shell/
set -uf -o pipefail

./network-name-warning.sh "Asaph" "This likely breaks audio routing to/from the audio console.\n\nYou should set the name back to Asaph in the Sharing tab of System Preferences, then restart Dante Virtual Soundcard."
