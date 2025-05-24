{
  vim.languages.rust = {
    enable = true;
    crates.enable = true;
    dap.enable = true;
    format.enable = true;
    lsp = {
      enable = true;
      opts =
        # lua
        ''
          ['rust-analyzer'] = {
            formatting = {
              command = {"nix", "fmt", "--offline", "--", "-"},
            },
          },
        '';
    };
    treesitter.enable = true;
  };
}
