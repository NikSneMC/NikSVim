{
  description = "NikSne's nvf configuration";

  inputs = {
    systems.url = "github:nix-systems/default";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    flake-compat = {
      url = "git+https://git.lix.systems/lix-project/flake-compat.git";
      flake = false;
    };

    # Alternate neovim-wrapper
    mnw.url = "github:Gerg-L/mnw";

    nvf = {
      url = "/home/niksne/Projects/github/NikSneMC/nvf";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        flake-compat.follows = "flake-compat";
        mnw.follows = "mnw";
      };
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

    deadnix = {
      url = "github:astro/deadnix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        utils.follows = "flake-utils";
      };
    };
  };

  outputs = {
    self,
    flake-parts,
    nvf,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;

        packages = let
          inherit (nvf.lib) neovimConfiguration;
        in {
          default =
            (neovimConfiguration {
              inherit pkgs;
              extraSpecialArgs = {
                inherit self;
                inputs' = inputs;
              };
              modules = [(import ./modules)];
            }).neovim;
        };
      };
    };
}
