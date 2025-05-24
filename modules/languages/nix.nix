{
  vim.languages.nix = {
    enable = true;
    extraDiagnostics.enable = true;
    format.enable = true;
    lsp = {
      enable = true;
      server = "nil";
    };
    treesitter.enable = true;
  };
}
