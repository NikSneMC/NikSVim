{
  imports = [
    ./images.nix
    ./motion.nix
    ./outline.nix
    ./preview.nix
  ];

  vim.utility = {
    ccc.enable = true;
    diffview-nvim.enable = true;
    direnv.enable = true;
    icon-picker.enable = true;
    mkdir.enable = true;
    multicursors.enable = true;
    nix-develop.enable = true;
    sleuth.enable = true;
    surround.enable = true;
    vim-wakatime.enable = true;
    yazi-nvim.enable = true;
  };
}
