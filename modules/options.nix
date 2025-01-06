env: {
  options,
  lib,
  ...
}: let
  inherit (lib) types mkOption;
in {
  options.programs.niksvim =
    {
      # e = builtins.throw (builtins.concatStringsSep " " (builtins.attrNames options.programs.nixvim));
      inherit (options.programs) nixvim;
      disableArrowKeys = mkOption {
        type = types.bool;
        default = false;
        example = true;
        description = ''
          Completely disable arrow keys.
          Useful if you're unfamiliar with vim motions
        '';
      };
    }
    // (lib.optionalAttrs (env == "nixos" || env == "homeManager") {
      # inherit (options.programs.nixvim) defaultEditor;
    })
    // (lib.optionalAttrs (env == "homeManager") {
      # inherit (options.programs.nixvim) vimdiffAlias;
    });
}
