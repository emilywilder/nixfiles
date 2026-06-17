{ config, pkgs, ... }:
{
  # Whether to enable Touch ID with sudo.
  security.pam.services.sudo_local.touchIdAuth = true;

  system.defaults = {
    NSGlobalDomain = {
      # Configures the trackpad tap behavior. Mode 1 enables tap to click.
      "com.apple.mouse.tapBehavior" = null;

      # Whether to enable moving window by holding anywhere on it like on Linux.
      # The default is false.
      NSWindowShouldDragOnGesture = true;

      # Avoid creating .DS_Store files on network or USB volumes.
      #FIXME "com.apple.desktopservices DSDontWriteNetworkStores" = true;
      #FIXME "com.apple.desktopservices DSDontWriteUSBStores" = true;

      # Don't autofill in Safari.
      #FIXME "com.apple.Safari AutoFillFromAddressBook" = false;
      #FIXME "com.apple.Safari AutoFillPasswords" = false;
      #FIXME "com.apple.Safari AutoFillCreditCardData" = false;
      #FIXME "com.apple.Safari AutoFillMiscellaneousForms" = false;

      # Enable Secure Keyboard Entry in Terminal.app
      # See: https://security.stackexchange.com/a/47786/8918
      #FIXME "com.apple.terminal SecureKeyboardEntry" = true;
    };

    finder = {
      # Whether to show external disks, hard drives, connected servers,
      # and removable media on desktop.
      ShowExternalHardDrivesOnDesktop = true;
      ShowHardDrivesOnDesktop = false;
      ShowMountedServersOnDesktop = true;
      ShowRemovableMediaOnDesktop = true;

      # Keep folders on top when sorting by name.
      _FXSortFoldersFirst = true;

      # Change the default search scope. Use “SCcf” to default to current folder.
      # The default is unset (“This Mac”).
      FXDefaultSearchScope = "SCcf";
    };

    dock = {
      # Enable highlight hover effect for the grid view of a stack in the Dock.
      mouse-over-hilite-stack = true;
      # Whether to group windows by application in Mission Control’s Exposé. The default is false.
      expose-group-apps = true;
      # Show recent applications in the dock. The default is true.
      show-recents = false;
      # Whether to minimize windows into their application icon. The default is false.
      minimize-to-application = true;
    };

    # Allow users to login to the machine as guests using the Guest account. Default is true.
    loginwindow.GuestEnabled = false;

    #Use scroll gesture with the Ctrl (^) modifier key to zoom. The default is false.
    #FIXME universalaccess.closeViewScrollWheelToggle = true;

    # The filesystem path to which screencaptures should be written.
    screencapture.location = "/Users/${config.my.username}/Pictures/Screenshots";
  };
}
