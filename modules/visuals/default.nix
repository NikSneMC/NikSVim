{
  imports = [
    ./indent-blankline.nix
  ];

  vim.visuals = {
    cinnamon-nvim.enable = true;
    highlight-undo.enable = true;
    nvim-web-devicons.enable = true;
    rainbow-delimiters.enable = true;
  };
}
