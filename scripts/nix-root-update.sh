#!/bin/sh

NIX_DAEMON_SOCKET="/nix/var/nix/daemon-socket/socket"

darwinCheck() {
    if [ "$(uname)" != "Darwin" ] ; then
        return 1
    else
        return 0
    fi
}

updateNix() {
    echo "Updating nix-channel..."
    if nix-channel --update; then
        echo "Upgrading nix..."
        nix-env --install --file '<nixpkgs>' --attr nix -I nixpkgs=channel:nixpkgs-unstable
        return $?
    else
        return $?
    fi
}

reloadDaemon() {
    launchctl remove org.nixos.nix-daemon
    echo "Waiting for nix-daemon to be removed...\c"
    while pgrep nix-daemon >/dev/null; do
        sleep 1
        echo ".\c"
    done
    echo "done"
    # launchctl load returns 0 in fail states
    echo "Loading plist..."
    if ! launchctl load /Library/LaunchDaemons/org.nixos.nix-daemon.plist; then
        echo "failed"
        return 1
    else
        echo "Waiting for nix-daemon socket...\c"
        while ! socat -u OPEN:/dev/null UNIX-CONNECT:${NIX_DAEMON_SOCKET} >/dev/null 2>&1
        do
            sleep 1
            echo ".\c"
        done
        echo "done"
        return 0
    fi
}

# check platform
if ! darwinCheck; then
    echo "$(basename "$0") must be run on Darwin"
    exit 1
fi
# update Nix
if ! updateNix; then
    echo "nix update failed" >&2
    exit 1
fi
# reload nix daemon
if ! reloadDaemon; then
    echo "daemon reload failed" >&2
    exit 2
fi