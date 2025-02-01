{pkgs, ...}: {
  plugins.treesitter = {
    enable = true;
    package = pkgs.vimPlugins.nvim-treesitter;
    settings.highlight.enable = true;
  };
  filetype.pattern = {
    ".*/hypr/hypr.*%.conf" = "hyprlang";
    ".*.http" = "http";
  };
}
