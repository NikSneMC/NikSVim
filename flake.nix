{
  description = "NikSne's NixVim configuration.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        nuschtosSearch.follows = "";
        home-manager.follows = "home-manager";
        nix-darwin.follows = "nix-darwin";
        devshell.follows = "";
        treefmt-nix.follows = "";
        flake-compat.follows = "";
        git-hooks.follows = "";
      };
    };
  };

  outputs = _: {
    modules = rec {
      default = config // theme;
      config = import ./config;
      theme = import ./modules/theme.nix;
      # options = import ./modules/options.nix; # WIP
    };
  };
}
