HOME ?= /Users/emily
CONFIG_DIR = $(HOME)/.config
PWD := $(realpath ./)

.PHONY: GNUmakefile
.DEFAULT_GOAL := install

tools := grep nix-channel nix-env nix-shell stat ln which unlink
$(tools):
	@which $@ > /dev/null

ifeq (Directory, $(shell stat -f "%HT" $(CONFIG_DIR)/home-manager 2>/dev/null))
	$(error $(CONFIG_DIR)/home-manager already exists, aborting...)
endif

.PHONY: channel
channel: nix-channel grep
ifeq (,$(shell nix-channel --list | grep home-manager))
	$(info adding home-manager channel...)
	nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
	nix-channel --update
endif

.PHONY: channel-clean
channel-clean: nix-channel
	$(info removing home-manager channel...)
	nix-channel --remove home-manager

.PHONY: home-manager
home-manager: channel which nix-shell | $(CONFIG_DIR)/home-manager
ifeq (, $(shell which home-manager))
	$(info home-manager not found, installing...)
	nix-shell '<home-manager>' -A install
endif

.PHONY: home-manager-clean
home-manager-clean: nix-shell
	nix-env -e home-manager-path

# don't add ln as a requirement to avoid target being checked for timestamp changes
$(CONFIG_DIR)/home-manager: | $(PWD)/home-manager
	ln -s $| $@

.PHONY: link
link: | $(CONFIG_DIR)/home-manager

.PHONY: clean
clean: channel-clean home-manager-clean unlink
ifeq (Symbolic Link, $(shell stat -f "%HT" $(CONFIG_DIR)/home-manager 2>/dev/null))
	unlink $(CONFIG_DIR)/home-manager
endif

.PHONY: install
install: home-manager
	home-manager switch

.PHONY: uninstall
uninstall: clean