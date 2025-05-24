{
  vim.ui.noice = {
    enable = true;
    setupOpts = {
      lsp.override."cmp.entry.get_documentation" = true;
      presets = {
        inc_rename = true;
        lsp_doc_border = true;
      };
    };
  };
}
