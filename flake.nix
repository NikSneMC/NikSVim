{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-compat.follows = "flake-compat";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        nuschtosSearch.follows = "";
        home-manager.follows = "";
        nix-darwin.follows = "";
        devshell.follows = "devshell";
        flake-compat.follows = "flake-compat";
        git-hooks.follows = "git-hooks";
        treefmt-nix.follows = "treefmt-nix";
      };
    };
  };

  outputs = {
    self,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      imports = [
        inputs.nixvim.flakeModules.default
      ];

      nixvim = {
        packages.enable = true;
        checks.enable = true;
      };

      flake.nixvimModules = {
        default = ./config;
        codeium = ./config/plugins/cmp/codeium.nix;
      };

      perSystem = {
        system,
        pkgs,
        ...
      }: {
        formatter = pkgs.alejandra;

        nixvimConfigurations = let
          mkNikSVimConfig = modules:
            inputs.nixvim.lib.evalNixvim {
              inherit system modules;
            };
        in
          with self.nixvimModules; {
            default = mkNikSVimConfig [
              default
            ];
            with-codeium = mkNikSVimConfig [
              default
              codeium
            ];
          };
      };
    };
}
