CHANNEL ?= master
FLAKE = flake.nix
NIX_DARWIN_DIR = /etc/nix-darwin
NIX_DARWIN_CONFIG = $(NIX_DARWIN_DIR)/$(FLAKE)

FLAKE_TIMESTAMP_PATH = .make.timestamp.$(FLAKE)

USER = $(shell id -nu)
GROUP = $(shell id -ng)
STAT_FLAGS = $(shell stat --version &>/dev/null && echo "-c \"$Y\"" || echo "-f \"%m\"")
PREV_FLAKE_TIMESTAMP = $(shell cat $(FLAKE_TIMESTAMP_PATH) 2>&1)
CUR_FLAKE_TIMESTAMP = $(shell stat $(STAT_FLAGS) $(FLAKE) 2>&1)

$(FLAKE) :
	nix flake init -t nix-darwin/$(CHANNEL)
	sed -i '' "s/simple/$(shell scutil --get LocalHostName)/" $@
	@stat $(STAT_FLAGS) $@ > $(FLAKE_TIMESTAMP_PATH)

$(NIX_DARWIN_DIR) :
	sudo mkdir -p $@
	sudo chown $(USER):$(GROUP) $@

$(NIX_DARWIN_CONFIG) : $(NIX_DARWIN_DIR) $(FLAKE)
	sudo install -o $(USER) -g $(GROUP) $(FLAKE) $(NIX_DARWIN_DIR)

.PHONY : install
install : $(NIX_DARWIN_CONFIG)

.PHONY : uninstall
uninstall :
ifneq (,$(wildcard $(NIX_DARWIN_CONFIG)))
	sudo rm $(NIX_DARWIN_CONFIG)
endif
ifneq (,$(wildcard $(NIX_DARWIN_DIR)))
	sudo rmdir $(NIX_DARWIN_DIR)
endif

.PHONY : clean
clean :
ifneq (,$(wildcard $(FLAKE)))
ifeq ($(PREV_FLAKE_TIMESTAMP),$(CUR_FLAKE_TIMESTAMP))
	rm $(FLAKE)
else
	$(error "$(FLAKE) does not match the one created by this Makefile.")
endif
endif

.PHONY : help
help :
	@echo "Usage:"
	@echo
	@echo "make [target]"
	@printf "     %s\n" "The default target is $(FLAKE)."
	@echo
	@printf "     %-19s %s\n" $(FLAKE)    "Initialize $(FLAKE) using $(CHANNEL)."
	@printf "     %-19s %s\n" "clean"     "Remove $(FLAKE) if and only if the last modified"
	@printf "     %-19s %s\n" ""          "timestamp for $(FLAKE) matches the one created by"
	@printf "     %-19s %s\n" ""          "this Makefile as recorded in the file"
	@printf "     %-19s %s\n" ""          "$(FLAKE_TIMESTAMP_PATH)."
	@printf "     %-19s %s\n" "install"   "Install $(FLAKE) to $(NIX_DARWIN_CONFIG)."
	@printf "     %-19s %s\n" "uninstall" "Remove $(NIX_DARWIN_CONFIG) and $(NIX_DARWIN_DIR)."
	@echo
	@echo "The following environment variables are available:"
	@printf "     %-19s %s\n" "CHANNEL" "The nix-darwin channel to use for initializing a"
	@printf "     %-19s %s\n" ""        "nix-darwin flake. As of this writing, the unstable"
	@printf "     %-19s %s\n" ""        "channel is 'master' and the stable channel is"
	@printf "     %-19s %s\n" ""        "'nix-darwin-24.11'."
