{
  imports = [
    ./gitlinker-nvim.nix
    ./gitsigns.nix
  ];
  vim.git = {
    git-conflict.enable = true;
    vim-fugitive.enable = true;
  };
}
