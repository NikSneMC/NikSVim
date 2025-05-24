{
  imports = [
    ./borders.nix
    ./colorizer.nix
    ./noice.nix
    ./smartcolumn.nix
  ];

  vim.ui = {
    fastaction.enable = true;
    illuminate.enable = true;
  };
}
