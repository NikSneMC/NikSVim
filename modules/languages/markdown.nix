{
  vim.languages.markdown = {
    enable = true;
    extensions = {
      markview-nvim.enable = true;
      render-markdown-nvim.enable = true;
    };
    extraDiagnostics.enable = true;
    format.enable = true;
    lsp.enable = true;
    treesitter.enable = true;
  };
}
