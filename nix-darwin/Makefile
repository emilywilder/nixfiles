CHANNEL ?= master # stable is nix-darwin-24.11
FLAKE = flake.nix
NIX_DARWIN_DIR = /etc/nix-darwin
NIX_DARWIN_CONFIG = $(NIX_DARWIN_DIR)/$(FLAKE)

USER = $(shell id -nu)
GROUP = $(shell id -ng)

$(FLAKE) :
	nix flake init -t nix-darwin/$(CHANNEL)
	sed -i '' "s/simple/$(shell scutil --get LocalHostName)/" $@

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

.PHONY: clean
clean :
ifneq (,$(wildcard $(FLAKE)))
	rm $(FLAKE)
endif
