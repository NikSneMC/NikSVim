{
  inputs',
  lib,
  pkgs,
  ...
}: {
  vim = {
    languages.nix = {
      enable = true;
      extraDiagnostics.enable = false; # https://github.com/oppiliappan/statix/issues/88
      format.enable = true;
      lsp = {
        enable = true;
        server = "nil";
      };
      treesitter.enable = true;
    };

    diagnostics.nvim-lint.linters.deadnix.cmd = lib.mkForce (lib.getExe' inputs'.deadnix.packages.${pkgs.system}.deadnix "deadnix");
  };
}
