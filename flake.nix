{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        nuschtosSearch.follows = "";
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
