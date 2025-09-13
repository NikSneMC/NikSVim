{
  imports = [
    ./indent-blankline.nix
    ./cinnamon-nvim.nix
  ];

  vim.visuals = {
    highlight-undo.enable = true;
    nvim-web-devicons.enable = true;
    rainbow-delimiters.enable = true;
  };
}
