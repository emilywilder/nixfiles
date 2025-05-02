#!/bin/sh
# based on https://github.com/LnL7/nix-darwin/blob/master/README.md

_channel=
if [ "$1" ]; then
    if [ "$1" = "unstable" ]; then
        _channel="master"
    elif [ "$1" = "stable" ]; then
        _channel="nix-darwin-24.11"
    else
        _channel="$1"
    fi
else
    echo "Usage:" >&2
    echo "  $0 <stable|unstable>" >&2
    echo "  $0 <channel-name>" >&2
    exit 1
fi

echo "using channel: ${_channel}"
set -e  # exit on failure

echo "creating /etc/nix-darwin"
sudo mkdir -p /etc/nix-darwin
echo "setting perms on /etc/nix-darwin"
sudo chown "$(id -nu)":"$(id -ng)" /etc/nix-darwin
cd /etc/nix-darwin
echo "initializing flake.nix"
nix flake init -t nix-darwin/"${_channel}"
echo "setting machine name in flake.nix"
sed -i '' "s/simple/$(scutil --get LocalHostName)/" flake.nix