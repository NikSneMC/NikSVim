{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    systems.url = "github:nix-systems/default";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
        flake-parts.follows = "flake-parts";
        nuschtosSearch.follows = "";
      };
    };

    nil = {
      url = "github:oxalica/nil";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
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
        windsurf = ./config/plugins/cmp/windsurf.nix;
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
              extraSpecialArgs = {
                inherit inputs self;
              };
            };
        in
          with self.nixvimModules; {
            default = mkNikSVimConfig [
              default
            ];
            with-codeium = mkNikSVimConfig [
              default
              windsurf
            ];
          };
      };
    };
}
