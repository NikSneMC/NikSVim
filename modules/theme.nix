{lib, ...}: let
  inherit (lib) types mkOption;
in {
  options.programs.niksvim.flavor = mkOption {
    type = types.enum [
      "latte"
      "frappe"
      "macchiato"
      "mocha"
    ];
    default = "mocha";
    example = "latte";
    description = ''
      Catppuccin flavor for NikSVim.
    '';
  };
}
