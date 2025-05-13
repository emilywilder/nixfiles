NIX_DARWIN_CONFIG_PATH = /etc/nix-darwin/flake.nix
INSTALLER_SUFFIX = \#darwin-rebuild
UNINSTALLER = nix-darwin\#darwin-uninstaller

ifneq (,$(wildcard $(NIX_DARWIN_CONFIG_PATH)))
REPO = $(shell nix eval -f $(NIX_DARWIN_CONFIG_PATH) inputs.nix-darwin.url | sed 's/\"//g' | cut -d \/ -f 2-)
endif

.PHONY : install
install :
ifneq (,$(REPO))
	nix run $(REPO)$(INSTALLER_SUFFIX) -- switch
else
	$(error No repository obtained from $(NIX_DARWIN_CONFIG_PATH))
endif

.PHONY : uninstall
uninstall :
	nix --extra-experimental-features "nix-command flakes" run $(UNINSTALLER)

.PHONY : help
help :
	@echo "Usage:"
	@echo
	@echo "make [install|uninstall|help]"
	@echo
	@printf "     %-19s %s\n" "install"    "Install nix-darwin to your environment based on"
	@printf "     %-19s %s\n" ""           "the contents of $(NIX_DARWIN_CONFIG_PATH)."
	@echo
	@printf "     %-19s %s\n" "uninstall"  "Uninstall nix-darwin using $(UNINSTALLER)."
