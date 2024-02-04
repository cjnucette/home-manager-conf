update:
	nix flake update

build:
	home-manager switch

# debug:
# 	sudo nixos-rebuild switch --flake . --show-trace --verbose

history:
	nix profile history

clean:
	nix profile wipe-history --older-than 7d
	nix store gc --debug
