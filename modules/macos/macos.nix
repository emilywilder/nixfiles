{ config, pkgs, ... }: {
    # Whether to enable Touch ID with sudo.
    security.pam.services.sudo_local.touchIdAuth = true;
    # Configures the trackpad tap behavior. Mode 1 enables tap to click.
    system.defaults.NSGlobalDomain."com.apple.mouse.tapBehavior" = null;

    #Use scroll gesture with the Ctrl (^) modifier key to zoom. The default is false.
    #FIXME system.defaults.universalaccess.closeViewScrollWheelToggle = true;

    # Whether to show external disks, hard drives, connected servers,
    # and removable media on desktop.
    system.defaults.finder.ShowExternalHardDrivesOnDesktop = true;
    system.defaults.finder.ShowHardDrivesOnDesktop = false;
    system.defaults.finder.ShowMountedServersOnDesktop = true;
    system.defaults.finder.ShowRemovableMediaOnDesktop = true;

    # Keep folders on top when sorting by name.
    system.defaults.finder._FXSortFoldersFirst = true;

    # Change the default search scope. Use “SCcf” to default to current folder.
    # The default is unset (“This Mac”).
    system.defaults.finder.FXDefaultSearchScope = "SCcf";

    # Avoid creating .DS_Store files on network or USB volumes.
    #FIXME system.defaults.NSGlobalDomain."com.apple.desktopservices DSDontWriteNetworkStores" = true;
    #FIXME system.defaults.NSGlobalDomain."com.apple.desktopservices DSDontWriteUSBStores" = true;

    # Don't autofill in Safari.
    #FIXME system.defaults.NSGlobalDomain."com.apple.Safari AutoFillFromAddressBook" = false;
    #FIXME system.defaults.NSGlobalDomain."com.apple.Safari AutoFillPasswords" = false;
    #FIXME system.defaults.NSGlobalDomain."com.apple.Safari AutoFillCreditCardData" = false;
    #FIXME system.defaults.NSGlobalDomain."com.apple.Safari AutoFillMiscellaneousForms" = false;

    # The filesystem path to which screencaptures should be written.
    #FIXME system.defaults.screencapture.location = "${HOME}/Pictures/Screenshots";

    # Enable highlight hover effect for the grid view of a stack in the Dock.
    system.defaults.dock.mouse-over-hilite-stack = true;
    # Whether to group windows by application in Mission Control’s Exposé. The default is false.
    system.defaults.dock.expose-group-apps = true;
    # Show recent applications in the dock. The default is true.
    system.defaults.dock.show-recents = false;
    # Whether to minimize windows into their application icon. The default is false.
    system.defaults.dock.minimize-to-application = true;

    # Enable Secure Keyboard Entry in Terminal.app
    # See: https://security.stackexchange.com/a/47786/8918
    #FIXME system.defaults.NSGlobalDomain."com.apple.terminal SecureKeyboardEntry" = true;

    # Whether to enable moving window by holding anywhere on it like on Linux.
    # The default is false.
    system.defaults.NSGlobalDomain.NSWindowShouldDragOnGesture = true;
}