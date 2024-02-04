{
  description = "Home Manager configuration of cjnucette";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    my-nixvim = {
      url = "github:cjnucette/my-nixvim";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    neovimOverlay = final: prev: {
      neovim = inputs.my-nixvim.packages.${system}.default;
    };

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [neovimOverlay];
    };
  in {
    homeConfigurations."cjnucette" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
      extraSpecialArgs = inputs;

      # Specify your home configuration modules here, for example,
      # the path to your home.nix.
      modules = [
        ./home
        # (args: {nixpkgs.overlays = import ./overlays args;})
      ];
    };
  };
}
