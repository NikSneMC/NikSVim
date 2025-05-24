{
  vim.languages.python = {
    enable = true;
    dap.enable = true;
    format = {
      enable = true;
      type = "ruff";
    };
    lsp = {
      enable = true;
      server = "basedpyright";
    };
    treesitter.enable = true;
  };
}
