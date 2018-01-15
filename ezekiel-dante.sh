#!/usr/bin/env bash

# for safety: https://sipb.mit.edu/doc/safe-shell/
set -uf -o pipefail

./network-name-warning.sh "Ezekiel" "This likely breaks Graphics PC audio routing to the audio console.\n\nYou should set the name back to Ezekiel in the Sharing tab of System Preferences."
